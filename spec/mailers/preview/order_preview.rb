class OrderMailerPreview < ActionMailer::Preview
  def submitted_order_email
    order = Order.all.first || FactoryGirl.create(:order_with_items)
    OrderMailer.submitted_order_email(order)
  end
end
