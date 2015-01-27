class ChargesController < ApplicationController
  respond_to :html, :js

   def create

   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )
 
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 1500,
     description: "Blocipedia Membership - #{current_user.email}",
     currency: 'usd'
   )

  if current_user.standard?
    current_user.premium_start_date = Date.today
    current_user.save
    current_user.premium_end_date = (current_user.premium_start_date + 12.months)
    current_user.role = :premium
    current_user.save
    redirect_to root_path
    flash[:success] = "Congratulations #{current_user.email}, you have upgraded to premium membership"

  elsif current_user.premium?
    new_end_date = (current_user.premium_end_date + 12.months)
    premium_end_date = new_end_date
    current_user.save
    redirect_to root_path
    flash[:success] = "Thanks #{current_user.email}, you have extended your premium membership until #{current_user.premium_end_date}."
  
  end 


 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
 end

 def new

  if current_user.premium? && current_user.renewal_inactive?
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