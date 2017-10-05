class Carteira < ApplicationRecord
  belongs_to :empresa
  belongs_to :user

  validates :data_da_compra,
    :entrada,
    :quantidade,
    presence: true

  validates :data_da_venda,
  	presence: true,
  	if: Proc.new { |klass| !klass.em_andamento? }

  # state_machine :situacao, initial: :em_andamento do
 	# 	event :encerrar do
 	# 		transition :em_andamento => :encerrado
 	# 	end
 	# end

 	def situacao33
 		self.situacao ||= 'em_andamento'
 	end

 	def valorizacao
 		(1.0 - (self.entrada / self.atual)) * 100.0
 	end

 	def valorizacao_positiva?
 		valorizacao > 1
 	end

 	def risco
 		(((self.entrada - self.stop) / self.entrada) * 100.0) * -1
 	rescue
 		0.0
 	end

 	def retorno
 		((self.alvo - self.entrada) / self.alvo) * 100.0
 	rescue
 		0.0
 	end

 	def ganho
 		valor_total - valor_total_da_entrada
 	end

 	def valor_total
 		self.atual * self.quantidade
 	end

 	def valor_total_da_entrada
 		self.entrada * self.quantidade
 	end

 	def em_andamento?
 		self.situacao != 'encerrado'
 	end

 	def encerrado?
 		self.situacao == 'encerrado'
 	end
end
