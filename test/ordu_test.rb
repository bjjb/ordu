# frozen_string_literal: true

require 'test_helper'

describe 'including Ordu' do
  subject { Module.new { include Ordu } }

  it('applies a DSL') { _(subject).must_be_kind_of(Ordu::DSL) }
end

describe 'an echo program' do
  subject do
    module Echo
      include Ordu

      name 'echo'
      version '0.1.0'
      summary 'A clone of echo(1)'
      desc 'A clone of the Unix echo command'
      on '-n', 'Do not add a trailing newline'
      action do |argv|
        return print(argv.join(' ')) if opt(:n)

        puts argv.join(' ')
      end

      self
    end
  end

  it('prints usage') do
    stdout, stderr = capture_io { subject.execute([]) }
    _(stdout).must_equal <<-STDOUT
    STDOUT
    _(stderr).must_equal <<-STDERR
    STDERR
  end
end
