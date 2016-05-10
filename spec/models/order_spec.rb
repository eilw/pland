require 'rails_helper'

describe Order, type: :model do
  it { is_expected.to belong_to :account }
  it { is_expected.to have_many :items }
end
