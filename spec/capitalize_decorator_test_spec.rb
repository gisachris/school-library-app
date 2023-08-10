require_relative '../decorators'
require 'rspec'

class MockNameable
  attr_accessor :correct_name

  def initialize(correct_name)
    @correct_name = correct_name
  end
end

describe CapitalizeDecorator do
  context 'Running Tests On CapitalizeDecorator Class And Its Methods' do
    let(:nameable) { MockNameable.new('dummy text') }
    let(:capitalizer) { CapitalizeDecorator.new(nameable) }

    it 'Should Be Instansiated Correctly' do
      expect(capitalizer).to be_an_instance_of CapitalizeDecorator
    end

    it 'Should Be A Inheritant Of The BaseDecorator' do
      expect(CapitalizeDecorator.superclass).to eq(BaseDecorator)
    end

    it '#correct_name Should Capitalize Any Given String Input' do
      # Stub the correct_name method of the MockNameable
      allow(nameable).to receive(:correct_name).and_return('dummy text')

      upper_case_text = capitalizer.correct_name
      expect(upper_case_text).to eq('DUMMY TEXT') # Check if it's uppercase
    end
  end
end
