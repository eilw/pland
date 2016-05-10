require 'rails_helper'

describe Item, type: :model do
  it { is_expected.to belong_to :order }
  it { is_expected.to belong_to :steel_type }
  it { is_expected.to belong_to :steel_finish }
  it { is_expected.to belong_to :steel_width }


end
