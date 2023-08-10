require_relative '../decorators'
require 'rspec'

describe TrimmerDecorator do
    context "Running Tests On TrimmerDecorator Class And Its Methods" do
        before(:each) do
            trimmer = CapitalizTrimmer.new
        end

        it "Should Be Instansiated Correctly" do
            expect(trimmer).to be_an_instance_of TrimmerDecorator
        end

        it "Should Be A Inheritant Of The BaseDecorator" do
            expect(TrimmerDecorator.superclass).to eq (BaseDecorator)
        end
    end
end