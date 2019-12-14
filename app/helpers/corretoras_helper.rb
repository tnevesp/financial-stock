module CorretorasHelper

	def corretora_label(corretora)
		css_label = corretora.xp? ? 'label-xp' : 'label-bb'
		content_tag('span', corretora.simbolo.upcase, { class: "label #{css_label}" })
	end
end