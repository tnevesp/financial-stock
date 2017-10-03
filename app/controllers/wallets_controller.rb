class WalletsController < ApplicationController

	def index
		@wallets = Wallet.joins(:paper).order('wallets.id asc')
	end

	def new
		@wallet = Wallet.new
	end

	def create
		@wallet = Wallet.new(wallet_params)
		if @wallet.save
			redirect_to wallets_path
		else
			render :new
		end
	end

	private

	def wallet_params
		params.require(:wallet).permit(:paper_id, :purchased_price, :quantity, :purchased_at, :sold_at, :sold_price, :status)
	end
end
