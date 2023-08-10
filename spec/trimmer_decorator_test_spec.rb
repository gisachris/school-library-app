require_relative '../decorators'
require 'rspec'

class MockNameable
  attr_accessor :correct_name

  def initialize(correct_name)
    @correct_name = correct_name
  end
end

describe TrimmerDecorator do
  context 'Running Tests On TrimmerDecorator Class And Its Methods' do
    let(:nameable) { MockNameable.new('very long text longer than 10 letters') }
    let(:trimmer) { TrimmerDecorator.new(nameable) }

    it 'Should Be Instansiated Correctly' do
      expect(trimmer).to be_an_instance_of TrimmerDecorator
    end

    it 'Should Be A Inheritant Of The BaseDecorator' do
      expect(TrimmerDecorator.superclass).to eq(BaseDecorator)
    end

    it '#correct_name Should Capitalize Any Given String Input' do
      # Stub the correct_name method of the MockNameable
      allow(nameable).to receive(:correct_name).and_return('very long text longer than 10 letters')

      text_trimmer = trimmer.correct_name
      expect(text_trimmer).to have_attributes(length: 10)
    end
  end
end
