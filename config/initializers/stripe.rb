Rails.configuration.stripe = {
  :publishable_key => 'pk_test_5n0Gg21YTPIf94Dwr5nfin0k',
  :secret_key      => 'sk_test_SKVSQ8AyUGxUeFO26U3886GW'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]