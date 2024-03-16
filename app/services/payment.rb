class Payment

def initialize(card_number:, amount:, issue_date:,cvv: )
	@card_number = card_number
	@amount= amount
	@issue_date = issue_date 
	@cvv = cvv
    
  end



def make_payment(card_number: @card_number, amount: @amount, issue_date: @issue_date, cvv: @cvv)
 Stripe.api_key = 'pk_test_51NiXEBSIMMg4G6d4rMTU8CeoHw5oID4auvzigTlHYXwYfELNtftXjUQdcYsLfpGZdIKE23hVYlJL4q0xBLf41un000JFYmmz4L'

payment_method=Stripe::PaymentMethod.create({ type: 'card', card: { number:@card_number, exp_month: @issue_date[5..6], exp_year: @issue_date[0..3], cvc: @cvv, },})



Stripe.api_key = 'sk_test_51NiXEBSIMMg4G6d4npfeWaLwC9YHh4OxdDEUeKKK4g24V2DYznTO6jAudDmr3lN0qHcDcXZefpWSAttDLSOPbTeT0069v0LGzt'


payment =Stripe::PaymentIntent.create({ amount: (@amount.to_i*100), currency: 'inr', automatic_payment_methods: {enabled: true, allow_redirects: 'never'}, payment_method: payment_method["id"] }) 



payment_confirm =Stripe::PaymentIntent.confirm( payment["id"])

end

end


# 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