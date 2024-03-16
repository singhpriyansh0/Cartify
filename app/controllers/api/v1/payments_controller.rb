class Api::V1::PaymentsController < ApplicationController

def index


end

def edit 

end

def update
  
 payment = Payment.new(card_number: params[:card_number], amount: params[:amount], issue_date: params[:issue_date], cvv: params[:cvv])
 payment.make_payment
 render json: XD , status: 201 

end



end











































  
# #   def create
# #      # var stripe = Stripe('pk_test_51NhUf1SEUTHzzT9Tf6WSzwSBV9CRAhHHTE8T2ZNIRKUQwbrIC7CpuowyDPdwFABpryAdufYn2pVL4mx9AWpI2LDC006rFyoAeD');
# #      # Stripe.setPublishableKey('pk_test_51NhUf1SEUTHzzT9Tf6WSzwSBV9CRAhHHTE8T2ZNIRKUQwbrIC7CpuowyDPdwFABpryAdufYn2pVL4mx9AWpI2LDC006rFyoAeD')
  

# #    session = Stripe::Checkout::Session.create({
# #     line_items: [{
# #       # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
# #       price: 'price_1NiDZuSEUTHzzT9T0k3mt52F',
# #       quantity: 1,

# #     }],
# #     mode: 'subscription',
# #     success_url: 'http://localhost:3000' + '/success.html',
# #     cancel_url: 'http://localhost:3000' + '/cancel.html',
# #   })

# # binding.pry
# # end

# def create 
#     session = Stripe::Checkout::Session.create({
#       line_items: [{
#         price: 'price_1NiDZuSEUTHzzT9T0k3mt52F',
#         quantity: 1,
#       }],
#       mode: 'subscription',
#       customer:'cus_OVFFGaVLudCdmA',
#       client_reference_id: 'prod_OVE1JBFNi6i4ga',
#       success_url: 'http://localhost:3000' + '/success.html',
#       cancel_url: 'http://localhost:3000' + '/cancel.html',
#     })

#     redirect_to session.url
#   end

# end















  
  
  
# # Stripe::PaymentIntent.create({
# #   amount: 1099,
# #   currency: 'inr',
# #   automatic_payment_methods: {enabled: true},
# # })

#   # charge = Stripe::Charge.create({
#   #     :customer => customer.id,
#   #     :amount => 500,
#   #     :description => 'Description of your product',
#   #     :currency => 'inr'
#   #   })
