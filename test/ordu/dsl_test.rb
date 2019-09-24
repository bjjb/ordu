# frozen_string_literal: true

require 'test_helper'

describe 'DSL' do
  let(:ordu) { MiniTest::Mock.new }

  subject do
    mock = ordu
    Module.new do
      @ordu = mock

      extend Ordu::DSL

      name 'foo'
      version '1.2.3'
    end
  end
end
