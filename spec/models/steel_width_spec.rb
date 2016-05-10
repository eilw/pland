require 'rails_helper'

describe SteelWidth, type: :model do
  it { is_expected.to belong_to :item }
end
