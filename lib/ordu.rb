# frozen_string_literal: true

require 'optparse'
require 'forwardable'

# Ordu is a library to help you build command-line programs.
module Ordu
  autoload :VERSION, 'ordu/version'

  def self.included(mod)
    mod.send(:extend, DSL)
  end

  def self.new
    Ordu::Base.new
  end

  # The base class of an Ordu. You can extend this, or you can include the
  # module.
  class Base
    extend Forwardable

    def initialize
      @parser = OptionParser.new
    end

    def name(*args)
      return @parser.set_program_name(*args) if args.empty?

      @parser.program_name
    end

    def version(*args)
      puts "Setting version: #{args}"
    end

    def option(*args)
      @parser.on(*args)
    end

    def parse!(*argv, into: nil)
      @parser.parse!(*argv, into: into)
      @action.call
    end

    def action(*methods, &block)
      if methods.empty? && !block_given?
        raise 'Invalid action (needs methods, symbols, or a block)'
      end

      @action = block
      methods.each do |m|
      end
    end
  end

  # The DSL of Ordu
  module DSL
    extend Forwardable
    delegate %i[
      name
      version
      parse!
      parser
      option
      options
      command
      commands
      action
    ] => :ordu

    def ordu
      @ordu ||= Ordu.new
    end
  end
end
