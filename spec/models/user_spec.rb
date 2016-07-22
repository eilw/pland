require 'rails_helper'

describe User, type: :model do
  let(:user_attributes) { FactoryGirl.attributes_for(:user) }

  describe 'validations' do
    it { is_expected.to have_many(:orders).dependent(:destroy) }

    it 'factory girl is valid' do
      user = FactoryGirl.create(:user, :approved)
      expect(user).to be_valid
      expect(user.approved).to be(true)
    end

    it 'requires the presence of a name, empresa, pais, telefono' do
      user = User.create(user_attributes)
      expect(user).to be_valid
    end

    it 'a user is invalid without a name' do
      user_attributes[:name] = nil
      user = User.create(user_attributes)
      expect(user).not_to be_valid
    end

    it 'a user is invalid without a company' do
      user_attributes[:company] = nil
      user = User.create(user_attributes)
      expect(user).not_to be_valid
    end

    it 'a user is invalid without a country' do
      user_attributes[:country] = nil
      user = User.create(user_attributes)
      expect(user).not_to be_valid
    end

    it 'a user is invalid without a name' do
      user_attributes[:phone_num] = nil
      user = User.create(user_attributes)
      expect(user).not_to be_valid
    end
  end
end
