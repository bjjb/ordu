# frozen_string_literal: true

require 'forwardable'

module Ordu
  # Allows a command-line to be executed, by ensuring the included module has
  # an Executor, and running it.
  module Execution
    def self.extended(mod)
      mod.send(:instance_variable_set, :@ordu, Executor.new)
    end

    extend Forwardable
    delegate execute: :@ordu
  end
end
