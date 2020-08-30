require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with description and category' do
    product = build(:product)

    expect(product).to be_valid
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:category) }
  end

  context 'instance methods' do
    it '.full_description' do
      product = build(:product)

      expect(product.full_description).to(eq("#{product.description} - #{product.price}"))
    end
  end
end
