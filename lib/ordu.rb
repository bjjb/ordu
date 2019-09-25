# frozen_string_literal: true

require 'optparse'

# Ordu is a library to help you build command-line programs.
class Ordu < OptionParser
  autoload :DSL, 'ordu/dsl'
  extend DSL
end
