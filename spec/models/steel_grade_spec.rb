require 'rails_helper'

describe SteelGrade, type: :model do
  it { is_expected.to have_many :items }
  it { is_expected.to belong_to :steel_type }
end
