module ApplicationHelper
	def is_active_controller(controller_name)
    params[:controller] == controller_name ? "active" : nil
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end

  def number_to_currency_br(numero)
  	number_to_currency(numero, precision: 2, separator: ',', delimiter: ".", unit: 'R$ ', position: 'before', format: '%u%n')
  end
end
