require_relative '../rails_helper'

RSpec.describe User, type: :model do
  let(:user1) { User.new(name: 'Anne Richie') }
  let(:user2) { User.new(name: 'Anne Richie') }

  context 'validation of a user name' do
    it 'creates a user when the name is uniq and valid' do
      expect(user1).to be_valid
    end

    it 'no create the user if the name is already taken' do
      user2.save
      expect(user1.valid?).to be_falsey
    end

    it 'no creates the user if the name is too short' do
      user2.name = 'John'
      user2.save
      expect(user2.valid?).to be_falsey
    end
  end

  context 'association of a user' do
    it 'could have cero o many reviews' do
      assc = User.reflect_on_association(:reviews)
      expect(assc.macro).to eq(:has_many)
    end
  end

  it { is_expected.to validate_presence_of(:name) }
end
