Rails.configuration.stripe = { 
  :publishable_key=>'pk_test_51NiXEBSIMMg4G6d4rMTU8CeoHw5oID4auvzigTlHYXwYfELNtftXjUQdcYsLfpGZdIKE23hVYlJL4q0xBLf41un000JFYmmz4L',
  :secret_key=>'sk_test_51NiXEBSIMMg4G6d4npfeWaLwC9YHh4OxdDEUeKKK4g24V2DYznTO6jAudDmr3lN0qHcDcXZefpWSAttDLSOPbTeT0069v0LGzt'
} 
Stripe.api_key = Rails.configuration.stripe[:secret_key]
