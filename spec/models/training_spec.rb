require 'rails_helper'

RSpec.describe Training, type: :model do
  fixtures :trainings
  

  it 'is valid when created' do
    expect(Training.new).to be_valid
  end


  describe '#practice_interval_steps' do
    it 'returns practice interval steps' do
        pending('This should not run')
        expect(training.practice_interval_steps()).to eql[0,1,7,16,35,70]
    end
  end

end
