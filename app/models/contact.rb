class Contact
  include ActiveModel::Model
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :company, :email, :message, :phone_num, :request_call
  validates :name, :email, :company, presence: true
end
