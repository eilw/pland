require 'rails_helper'

describe SteelFinish, type: :model do
  it { is_expected.to have_many :items }
end
