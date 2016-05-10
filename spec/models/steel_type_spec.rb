require 'rails_helper'

describe SteelType, type: :model do
  it { is_expected.to have_many :items }
end
