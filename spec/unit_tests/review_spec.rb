require_relative '../rails_helper'

RSpec.describe Review, type: :model do
  before :each do
    @user = User.create(name: 'Anne Richie')
    @category = Category.create(name: 'Drama')

    @review = Review.new(
      author_id: @user.id,
      title: 'What is Lorem Ipsum?',
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor'
    )

    @review.categories = [@category]
  end

  context 'when a new review is creating for a given user' do
    it 'is valid with valid attributes' do
      expect(@review).to be_valid
    end

    it 'is invalid with title less than 15 characters' do
      @review.title = 'What'
      expect(@review).to_not be_valid
    end

    it 'is invalid with text attribute less than 30 characters' do
      @review.text = 'It is a long established...'
      expect(@review.valid?).to eq(false)
    end

    it 'is invalid without a title attribute' do
      @review.title = nil
      expect(@review).to_not be_valid
    end

    it 'is invalid without a description attribute' do
      @review.text = nil
      expect(@review).to_not be_valid
    end
  end

  describe 'associations for the review' do
    it 'belongs to an user' do
      assc = Review.reflect_on_association(:author)
      expect(assc.macro).to eq :belongs_to
    end

    it 'could have many votes' do
      assc = Review.reflect_on_association(:votes)
      expect(assc.macro).to eq :has_many
    end

    it 'belongs to category classifications' do
      assc = Review.reflect_on_association(:classifications)
      expect(assc.macro).to eq :has_many
    end
  end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:text) }
end
