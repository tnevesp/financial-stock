class Wallet < ApplicationRecord
  belongs_to :paper

  validates :paper_id,
  	:purchased_price,
  	:quantity,
  	:purchased_at,
 		presence: true

 	state_machine :status, initial: :em_andamento do
 		event :encerrar do
 			transition :em_andamento => :encerrado
 		end
 	end
end
