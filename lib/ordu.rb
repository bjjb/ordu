# frozen_string_literal: true

require 'forwardable'

# Ordu is a library to help you build command-line programs.
class Ordu
  autoload :DSL, 'ordu/dsl'
  autoload :Parser, 'ordu/parser'

  extend Forwardable
  include DSL

  def initialize(&block)
    @parser = Parser.new
    instance_eval(&block)
  end

  private

  def subcommands
    self.class.subcommands
  end
end
