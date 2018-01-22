module CarteirasHelper

	def numero_para_porcentagem(numero, tag = 'p')
		css_cor = numero >= 0 ? 'text-navy' : 'text-danger'

		content_tag(tag, { class: "#{css_cor} text-right"} ) do
			number_to_currency(numero, precision: 2, separator: ',', delimiter: ".", unit: '%', position: 'after', format: '%n %u')
		end
	end
end