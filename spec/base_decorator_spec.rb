require_relative '../decorators'

class MockNameable
  def initialize(correct_name)
    @correct_name = correct_name
  end

  attr_reader :correct_name
end

RSpec.describe BaseDecorator do
  let(:mock_nameable) { MockNameable.new('Mock Correct Name') }
  subject { described_class.new(mock_nameable) }

  describe '#correct_name' do
    it 'returns the correct name from the decorated object' do
      expect(subject.correct_name).to eq('Mock Correct Name')
    end
  end
end
