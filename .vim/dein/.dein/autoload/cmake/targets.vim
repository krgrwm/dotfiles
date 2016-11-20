" File:        autoload/cmake/targets.vim
" Description: Handles the logic of interacting with targets.
" Author:      Jacky Alciné <me@jalcine.me>
" License:     MIT
" Website:     https://jalcine.github.io/cmake.vim
" Version:     0.5.5

func! cmake#targets#build(target)
  return cmake#util#run_cmake("--build " . cmake#util#binary_dir() .
        \ " --target " . a:target)
endfunc!

func! cmake#targets#exists(target)
  return index(cmake#targets#list(), a:target) != -1
endfunc

func! cmake#targets#binary_dir(target)
  let l:root_binary_dir = cmake#util#binary_dir()
  let l:root_source_dir = cmake#util#source_dir()
  let l:bindir = finddir('CMakeFiles/' . a:target . '.dir', l:root_binary_dir . '/**')
  if isdirectory(l:bindir)
    let l:bindir = fnamemodify(l:bindir, ':p:h')
  else
    let l:bindir = ""
  endif

  return l:bindir
endfunc!

func! cmake#targets#source_dir(target)
  if index(cmake#targets#list(), a:target) == -1
    return ''
  endif

  let l:build_dir  = cmake#targets#binary_dir(a:target)
  let l:source_dir = ""

  if !isdirectory(l:build_dir)
    return l:source_dir
  endif

  let l:root_binary_dir = cmake#util#binary_dir()
  let l:root_source_dir = cmake#util#source_dir()
  let l:source_dir = l:build_dir
  let l:source_dir = substitute(l:source_dir, '/CMakeFiles/' . a:target . '.dir', '', '')
  let l:source_dir = substitute(l:source_dir, l:root_binary_dir, l:root_source_dir, '')
  let l:source_dir = resolve(fnamemodify(l:source_dir, ':p:h'))
  return l:source_dir
endfunc!

func! cmake#targets#include_dirs(target)
  let flags = cmake#targets#flags(a:target)
  if empty(flags)
    return []
  endif

  let includes = filter(copy(flags), 'stridx(v:val, "-I") == 0')
  call map(includes, 'resolve(fnamemodify(substitute(v:val, "^-I", "", ""),":p"))')
  return includes
endfunc

func! cmake#targets#libraries(target)
  let l:libraries = []
  let l:libraries_lookup = cmake#extension#function_for('find_libraries_for_target', g:cmake_build_toolchain)
  let l:libraries = {l:libraries_lookup}(a:target)
  return l:libraries
endfunc

func! cmake#targets#for_file(filepath)
  let l:filename = fnamemodify(a:filepath,':t')
  let l:basename = substitute(fnamemodify(a:filepath,':t:r'), getcwd(), '', 'g')
  let l:fullname = substitute(fnamemodify(a:filepath,':p'), getcwd(), '', 'g')

  if has_key(g:cmake_cache.files, l:filename)
    return g:cmake_cache.files[l:filename]
  endif

  if has_key(g:cmake_cache.files, l:basename)
    return g:cmake_cache.files[l:basename]
  endif

  let l:targets = cmake#targets#list()
  if empty(l:targets)
    return ""
  endif

  let l:target = ''
  for aTarget in l:targets
    let l:srcdir = cmake#targets#source_dir(aTarget)
    let l:bindir = cmake#targets#binary_dir(aTarget)
    let l:file_exists = filereadable(l:fullname)

    let l:in_srcdir = (stridx(l:fullname, l:srcdir, 0) == 0)
    let l:in_bindir = (stridx(l:fullname, l:bindir, 0) == 0)
    let l:in_project = (l:in_srcdir || l:in_bindir) && l:file_exists

    if l:in_project
      let l:target = aTarget
      break
    else
      let files = cmake#targets#files(aTarget)
      call filter(files, 'strridx(v:val, l:filename) != -1')

      if len(files) != 0
        let l:target = aTarget
        break
      endif
    endif
  endfor

  if empty(l:target)
    return ""
  endif

  let g:cmake_cache.files[l:filename] = l:target
  return l:target
endfunc!

func! cmake#targets#flags(target)
  let l:flags = []

  if !cmake#targets#exists(a:target)
    return l:flags
  endif

  if empty(g:cmake_cache.targets[a:target].flags)
    let l:flags = cmake#flags#collect_for_target(a:target)
    let g:cmake_cache.targets[a:target].flags = l:flags
  endif

  return g:cmake_cache.targets[a:target].flags
endfunc!

func! cmake#targets#list()
  if empty(g:cmake_cache.targets)
    let l:targets_lookup = cmake#extension#function_for('find_targets', g:cmake_build_toolchain)
    let l:targets = {l:targets_lookup}()
    let l:target_dict = {}
    for target in l:targets
      let l:target_dict[target] = { 'files': [], 'flags' : [] }
    endfor

    let g:cmake_cache.targets = l:target_dict
  endif

  return keys(g:cmake_cache.targets)
endfunc

func! cmake#targets#files(target)
  if !cmake#targets#exists(a:target)
    return []
  endif


  if empty(g:cmake_cache.targets[a:target].files)
    let l:files_lookup = cmake#extension#function_for('find_files_for_target', g:cmake_build_toolchain)
    let l:files = {l:files_lookup}(a:target)

    func s:fix_up_path(target, filename)
      let l:filename = a:filename
      let l:srcdir = cmake#targets#source_dir(a:target)
      let l:bindir = cmake#targets#binary_dir(a:target)

      let l:binfile = fnamemodify(glob(l:bindir . "/**/" . a:filename),':.')
      let l:srcfile = fnamemodify(glob(l:srcdir . "/**/" . a:filename),':.')

      if !empty(l:binfile)
        let l:filename = l:binfile
      endif

      if !empty(l:srcfile)
        let l:filename = l:srcfile
      endif

      if empty(l:filename)
        let l:filename = a:filename
      endif

      return l:filename
    endfunc

    call map(l:files, "s:fix_up_path('".a:target."',v:val)")
    delfunc s:fix_up_path

    let g:cmake_cache.targets[a:target].files = l:files
  endif

  return g:cmake_cache.targets[a:target].files
endfunc!

func! cmake#targets#cache()
  for aTarget in cmake#targets#list()
    let files = cmake#targets#files(aTarget)

    if empty(files)
      continue
    endif

    for aFile in files
      let shorter_name = fnamemodify(aFile, ':r')
      let shortest_name = fnamemodify(aFile, ':t:r')
      let g:cmake_cache.files[aFile] = aTarget

      if !empty(shorter_name) && !has_key(g:cmake_cache.files,shorter_name)
        let g:cmake_cache.files[shorter_name] = aTarget
      endif

      if !empty(shortest_name) && !has_key(g:cmake_cache.files,shortest_name)
        let g:cmake_cache.files[shortest_name] = aTarget
      endif
    endfor
  endfor
endfunc

func! cmake#targets#clear_all()
  let g:cmake_cache.targets = {}
endfunc

func! cmake#targets#clear(target)
  let g:cmake_cache.targets.{a:target} = { 'files': [], 'flags' : [] }
endfunc
