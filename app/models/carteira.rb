class Carteira < ApplicationRecord
  belongs_to :empresa
  belongs_to :user
  belongs_to :corretora
  belongs_to :tipo_de_operacao

  validates :data_da_compra,
    :entrada,
    :quantidade,
    presence: true

  validates :data_da_venda,
  	presence: true,
  	if: Proc.new { |klass| !klass.em_andamento? }

  scope :em_andamento, -> { where(situacao: 'em_andamento') }
  scope :encerradas, -> { where(situacao: 'encerrado') }
  scope :where_ticker, -> (ticker) { joins(:empresa).where(empresas: { ticker: ticker} ) }

  # state_machine :situacao, initial: :em_andamento do
 	# 	event :encerrar do
 	# 		transition :em_andamento => :encerrado
 	# 	end
 	# end

 	def valorizacao
 		if self.tipo_de_operacao.compra?
      ((self.atual - self.entrada) / self.entrada) * 100.0
    else
      ((self.entrada - self.atual) / self.atual ) * 100.0
    end
 	end

 	def valorizacao_positiva?
 		valorizacao > 1
 	end

 	def risco
 		((self.stop - self.entrada) / self.entrada) * 100.0
 	rescue
 		0.0
 	end

 	def retorno
 		((self.alvo - self.entrada) / self.entrada) * 100.0
 	rescue
 		0.0
 	end

 	def ganho
    if self.tipo_de_operacao.compra?
      valor_total - valor_total_da_entrada
    else
      valor_total_da_entrada - valor_total
    end
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

  def ultima_movimentacao
    em_andamento? ? data_da_compra : data_da_venda
  end
end
