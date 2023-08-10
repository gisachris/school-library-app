require_relative '../nameable'
require 'rspec'

# Test to ensure that the correct_name method is implemented the Nameable subclass

class Subclass < Nameable
  def correct_name
    'Implemented in subclass'
  end
end

RSpec.describe Nameable do
  it 'raises NotImplementedError if correct_name is not implemented in a subclass' do
    expect { Nameable.new('Test').correct_name }.to raise_error(NotImplementedError)
  end

  it 'does not raise an error if correct_name is implemented in a subclass' do
    expect { Subclass.new('Test').correct_name }.not_to raise_error
  end
end
