class ChargesController < ApplicationController
  respond_to :html, :js

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken],
      plan: 'blocipedia premium'
    )
 
    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer: customer.id, # Note -- this is NOT the user_id in your app
      amount: 1500,
      #name: 'premium membership',
      description: "Blocipedia Membership - #{current_user.email}",
      currency: 'gbp'
    )

    current_user.role = :premium
    current_user.save
 
    flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
    redirect_to root_path # or wherever
 
 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def new

    if current_user.role == 'premium'
      redirect_to root_path
      flash[:error] = "You are already a premium member"
    end

    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Membership - #{current_user.name}",
      amount: 1500
    }
  end

end