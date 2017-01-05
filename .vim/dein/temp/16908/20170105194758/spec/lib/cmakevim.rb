module CMakeVim
  class Driver
    attr_reader :base_path, :vim, :dir

    def initialize(args)
      @vim = args[:vim]
      @base_path = args[:base_path]
      @base_path = File.dirname(File.expand_path('../..', __FILE__))
    end

    def create_new_project(args = {})
      args.merge!(extra_lines: '')

      Dir.glob(@base_path + '/spec/data/**').each do |file|
        new_place = file.gsub(@base_path + '/spec/data', Dir.pwd)
        FileUtils.copy(file, new_place)
      end
    end

    def configure_project(args = {})
      definitions = []
      args = {
        build_dir: 'build',
        definitions: {},
        options: []
      }.merge(args)

      args[:definitions].each do |key, value|
        aDef = "-D#{key}:STRING=\"#{value}\""
        definitions.push aDef
      end

      Dir.mkdir './build' unless Dir.exist? './build'
      pid = spawn("cd build && cmake .. #{args[:options].join(' ')} #{definitions.join(' ')}", [:out, :err] => '/dev/null')
      Process.wait pid
    end

    def build_project
      pid = spawn('make -C build', [:out, :err] => '/dev/null')
      Process.wait pid
    end

    def destroy_project
      FileUtils.rm_rf "#{Dir.pwd}/*"
    end

    alias_method :create_new, :create_new_project
    alias_method :configure, :configure_project
    alias_method :destroy, :destroy_project
    alias_method :build, :build_project
  end
end

require_relative 'cmakevim/environment'
require_relative 'cmakevim/rspec'
