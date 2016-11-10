class OrderMailer < ApplicationMailer
  default from: 'pland@example.com'

  def submitted_order_email(order)
    @order = order
    mail(to: @order.user.email, subject: 'Gracias por su solicitud de una cotización a IndiaSold')
  end
end
