module ApplicationHelper
  def display_price(amount)
    "$#{amount.to_f / 100}"
  end

  # def add_unit
  #   @tab = Tab.find(params[:tab_id])
  #   @tab_dish.tab = @tab
  #   if @tab_dish.update(quantity: @tab_dish.quantity + 1)
  #     redirect_to @tab
  #   else
  #     redirect_to @tab, alert: 'unable to add unit'
  #   end
  # end

  # def remove_unit
  #   @tab_dish.update(quantity: 1)
  # end

end
