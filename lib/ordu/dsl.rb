# frozen_string_literal: true

require 'forwardable'

module Ordu
  # The DSL of Ordu.
  module DSL
    extend Forwardable
    delegate %i[name version summary short description desc long option opt on
                options command commands before action after alias] => :@ordu
  end
end
