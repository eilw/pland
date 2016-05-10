require 'rails_helper'

describe SteelType, type: :model do
  it { is_expected.to belong_to :item }
end
