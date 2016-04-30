require 'rails_helper'

describe Contact do
  describe 'validates contact info' do

    it 'the fields can be added to' do
      valid_attrs = {
        name: 'test',
        email: 'test@example.com',
        company: 'TestCo',
        phone_num: '012345678',
        message: 'My message  to you',
        request_call: true
      }
      info = Contact.new(valid_attrs)
      expect(info).to be_valid

    end
  end
end
