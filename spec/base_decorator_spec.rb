# require_relative '../decorators'

# class MockNameable
#   def correct_name
#     'Mock Correct Name'
#   end
# end

# RSpec.describe BaseDecorator do
#   let(:mock_nameable) { MockNameable.new }
#   subject { described_class.new(mock_nameable) }

#   describe '#correct_name' do
#     it 'returns the correct name from the decorated object' do
#       expect(subject.correct_name).to eq('Mock Correct Name')
#     end
#   end
# end

require_relative '../decorators'

class MockNameable
  def correct_name
    'Mock Correct Name'
  end
end

RSpec.describe BaseDecorator do
  let(:mock_nameable) { MockNameable.new }
  subject { described_class.new(mock_nameable) }

  describe '#correct_name' do
    it 'returns the correct name from the decorated object' do
      expect(subject.correct_name).to eq('Mock Correct Name')
    end
  end
end
