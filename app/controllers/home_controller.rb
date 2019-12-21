class HomeController < ApplicationController
	def index
		@wallets = Wallet.joins(:paper).order('papers.name asc')
	end
end