module CarteirasHelper

	def numero_para_porcentagem(numero, tag = 'p')
		css_cor = numero >= 0 ? 'text-navy' : 'text-danger'

		content_tag(tag, { class: "#{css_cor} text-right"} ) do
			number_to_currency(numero, precision: 2, separator: ',', delimiter: ".", unit: '%', position: 'after', format: '%n %u')
		end
	end

	def option_from_collection_for_select_data
		Carteira.where(situacao: 'encerrado').order(data_da_venda: :desc).map { |c| [c.data_da_venda.strftime('%m/%Y'), c.data_da_venda.strftime('%m/%Y')] }.uniq
	end

	def tipo_de_operacao_label(tipo_de_operacao)
		css_label = tipo_de_operacao.compra? ? 'label-primary' : 'label-danger'
		content_tag('span', tipo_de_operacao.letra.upcase, { class: "label #{css_label}" })
	end
end