ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :stripe_plan_name, :paypal_plan_name, :price_cents, :price_currency
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :stripe_plan_name, :paypal_plan_name, :price_cents, :price_currency]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
