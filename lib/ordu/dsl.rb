# frozen_string_literal: true

class Ordu
  # The DSL of Ordu.
  module DSL
    def name(*args)
      return (name = yield) if args.empty? && block_given?

      return name || super if args.empty?

      self.name = args.join(' ')
    end

    def name=(name)
      @name = name
    end

    def version(*args)
      return (version = yield) if args.empty? && block_given?

      return version if args.empty?

      self.version = args.join(' ')
    end

    def version=(version)
      @version = version
    end

    def summary(*args)
      return (summary = yield) if args.empty? && block_given?

      return summary if args.empty?

      self.summary = args.join("\n")
    end

    def summary=(summary)
      @summary = summary
    end
    alias short summary

    def description(*args)
      return (description = yield) if args.empty? && block_given?

      return description if args.empty?

      self.description = args.join("\n")
    end
    alias desc description
    alias long description

    def description=(description)
      @description = description
    end

    def option(*args)
      options.push(args)
    end
    alias on option

    def options
      @options ||= []
    end

    def argument(*args)
      arguments.push(args)
    end
    alias arg argument

    def arguments
      @arguments ||= []
    end

    def action(*args)
      actions.push(args)
    end

    def actions
      @actions ||= []
    end

    def parse!(argv = ARGV)
      puts <<-DESC
        Parsing (#{argv})!
        name = #{name}
        version = #{version}
        summary = #{summary}
        description = #{description}
        options = #{options}
        arguments = #{arguments}
        actions = #{actions}
      DESC
    end
  end
end
