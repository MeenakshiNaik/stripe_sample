class PaymentsController < ApplicationController
	def new
    @plan = Plan.where(id: params['plan_id']).last
  end

  def create
    if current_user and params['plan_id'] and params['stripeToken']
      customer = Stripe::Customer.create(card: params["stripeToken"] ,email: params['stripeEmail'])
      plan = Plan.find(params['plan_id'])
      Stripe::Charge.create(:amount => plan.amount, :currency => plan.currency, :customer => customer.id)
      current_user.update_columns(stripe_token: customer.id ,plan_id: plan.id)
      redirect_to root_path
    end
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payments_path
    flash[:notice] = "Please try again"
  end
end
