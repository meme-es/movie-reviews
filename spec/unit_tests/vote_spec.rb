require_relative '../rails_helper'

RSpec.describe Vote, type: :model do
  context 'when a user vote for a review' do
    it 'must be associated to a user and a review to ve valid' do
      vote = Vote.new
      expect(vote.valid?).to eql(false)
    end
  end

  context 'associacion of a vote' do
    it 'belongs to a user' do
      vote = Vote.reflect_on_association(:user)
      expect(vote.macro).to eq :belongs_to
    end

    it 'belongs to a review' do
      vote = Vote.reflect_on_association(:review)
      expect(vote.macro).to eq :belongs_to
    end
  end
end
