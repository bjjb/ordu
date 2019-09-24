# frozen_string_literal: true

require 'optparse'

# Ordu is a library to help you build command-line programs.
module Ordu
  autoload :DSL, 'ordu/dsl'
  autoload :Execution, 'ordu/execution'
  autoload :Executor, 'ordu/executor'
  autoload :VERSION, 'ordu/version'

  def self.included(mod)
    mod.send(:extend, DSL)
    mod.send(:extend, Execution)
  end
end
