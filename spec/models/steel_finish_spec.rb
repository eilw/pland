require 'rails_helper'

describe SteelFinish, type: :model do
  it { is_expected.to belong_to :item }
end
