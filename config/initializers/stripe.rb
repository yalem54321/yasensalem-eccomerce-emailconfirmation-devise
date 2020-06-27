Rails.application.configure do
  config.stripe.secret_key = ENV["STRIPE_SECRET_KEY"]
  config.stripe.publishable_key = ENV["STRIPE_PUBLISHABLE_KEY"]
end
def self.execute_subscription(plan:, token:, customer:)
  customer.subscriptions.create({
    plan: plan
  })
end

def self.find_or_create_customer(card_token:, customer_id:, email:)
  if customer_id
    stripe_customer = Stripe::Customer.retrieve({ id: customer_id })
    if stripe_customer
      stripe_customer = Stripe::Customer.update(stripe_customer.id, { source: card_token})
    end
  else
    stripe_customer = Stripe::Customer.create({
      email: email,
      source: card_token
    })
  end
  stripe_customer
end