ogglist = split(readall(`./ogg_files`))

function play(ogglist, n)
    run(`ogg123 $(ogglist[n])`)
end

#play(ogglist, 1)

funcs = Dict{Char, Function}('n' => ind->play(ogglist, ind))
global command

while (x=readline(STDIN); x != "")
    command, arg = x
    funcs[command](convert(Int, arg))
end
