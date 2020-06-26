require_relative '../rails_helper'

RSpec.describe Category, type: :model do
  let(:category1) { Category.new(name: 'Drama') }
  let(:category2) { Category.new(name: 'Drama') }

  context 'validation of a name' do
    it 'creates a category when the name is uniq and valid' do
      expect(category1).to be_valid
    end

    it 'no create the category if the name is already taken' do
      category2.save
      expect(category1.valid?).to be_falsey
    end

    it 'no creates the category if the name is too short' do
      category2.name = 'Act'
      category2.save
      expect(category2.valid?).to be_falsey
    end
  end

  context 'association of a category' do
    it 'belongs to an author' do
      assc = Review.reflect_on_association(:author)
      expect(assc.macro).to eq(:belongs_to)
    end
  end

  it { is_expected.to validate_presence_of(:name) }
end
