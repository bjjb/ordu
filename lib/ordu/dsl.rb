# frozen_string_literal: true

class Ordu
  # The DSL of Ordu.
  module DSL
    def name(*args)
      return name(yield) if args.empty? && block_given?

      return name || super if args.empty?

      self.name = args.join(' ')
    end

    def name=(name)
      @name = name
    end

    def version(*args)
      return version(yield) if args.empty? && block_given?

      return version if args.empty?

      self.version = args.join(' ')
    end

    def version=(version)
      @version = version
    end

    def summary(*args)
      return summary(yield) if args.empty? && block_given?

      return summary if args.empty?

      self.summary = args.join("\n")
    end

    def summary=(summary)
      @summary = summary
    end
  end
end
