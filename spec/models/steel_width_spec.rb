require 'rails_helper'

describe SteelWidth, type: :model do
  it { is_expected.to have_many :items }
end
