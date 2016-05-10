require 'rails_helper'

describe Account, type: :model do
  it { is_expected.to belong_to :user }

  it { is_expected.to have_many :orders }
end
