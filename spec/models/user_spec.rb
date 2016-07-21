require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:orders).dependent(:destroy) }

  it 'factory girl is valid' do
    user = FactoryGirl.create(:user, :approved)
    expect(user).to be_valid
    expect(user.approved).to be(true)
  end
end
