# frozen_string_literal: true

require 'optparse'
require 'forwardable'

# Ordu is a library to help you build command-line programs.
module Ordu
  autoload :VERSION, 'ordu/version'

  def self.included(mod)
    mod.send(:extend, DSL)
    mod.send(:extend, Runner)
  end

  # Methods to run an Ordu program
  module Runner
    def start!(args = ARGV)
      option_parser.order!(args)
      puts 'Starting!'
    end
  end

  # The DSL of Ordu
  module DSL
    def desc(desc = nil)
      return @desc if desc.nil?

      @desc = desc
    end

    def name(name = nil)
      return @name if name.nil?

      @name = name
    end

    def version(version = nil)
      return @version if version.nil?

      @version = version
    end

    def help(help = nil)
      return @help if help.nil?

      @help = help
    end

    def opt(*args)
      option_parser.on(*args)
    end

    def option_parser
      @option_parser ||= OptionParser.new
    end

    def arg(name, type: String, required: false)
      args << [name, type, required]
    end

    def args
      @args ||= []
    end

    def before(&block)
      @before ||= []
      @before << block
    end

    def after(&block)
      @after ||= []
      @after << block
    end

    def action(&block)
      @actions ||= []
      @actions << block
    end
  end
end
