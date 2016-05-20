class Order < ActiveRecord::Base
  belongs_to :account
  has_many :items
  accepts_nested_attributes_for :items
end
