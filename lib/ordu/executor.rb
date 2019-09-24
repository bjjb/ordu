# frozen_string_literal: true

module Ordu
  # An Ordu instance, which can execute a command-line.
  class Executor
    def initialize
      @name = @version = @summary = @description = nil
      @options = @commands = @before = @actions = @after = []
      @option_parser = OptionParser.new
    end

    def name(*args)
      return @name if args.empty?

      @name = args.join(' ').freeze
    end
    alias program_name name
    alias progname name

    def version(*args)
      return @version if args.empty?

      @version = args.join('.').freeze
    end

    def summary(*args)
      return @summary if args.empty?

      @summary = args.join("\n").freeze
    end
    alias short summary

    def description(*args)
      return @description if args.empty?

      @description = args.join("\n").freeze
    end
    alias desc description
    alias long description

    def option(*args, &block)
      @option_parser.on(*args, &block)
    end
    alias opt option
    alias on option

    def before(&block)
      @before.append(&block)
    end

    def action(&block)
      @actions.append(&block)
    end

    def after(&block)
      @after.append(&block)
    end
  end
end
