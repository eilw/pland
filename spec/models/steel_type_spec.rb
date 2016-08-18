require 'rails_helper'

describe SteelType, type: :model do
  it { is_expected.to have_many :items }
  it { is_expected.to have_many :steel_widths }
  it { is_expected.to have_many :steel_grades }
end
