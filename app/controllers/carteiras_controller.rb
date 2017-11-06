class CarteirasController < ApplicationController
  before_action :set_carteira, only: [:show, :edit, :update, :destroy]

  # GET /carteiras
  # GET /carteiras.json
  def index
    if params[:situacao].blank?
      @carteiras = Carteira.where(situacao: 'em_andamento').order(data_da_compra: :asc, id: :desc)
    elsif params[:situacao] == 'todos'
      @carteiras = Carteira.all.order(data_da_compra: :asc, id: :desc)
    else
      @carteiras = Carteira.where(situacao: params[:situacao]).order(data_da_compra: :asc, id: :desc)
    end
  end

  # GET /carteiras/1
  # GET /carteiras/1.json
  def show
  end

  # GET /carteiras/new
  def new
    @carteira = Carteira.new
  end

  # GET /carteiras/1/edit
  def edit
  end

  # POST /carteiras
  # POST /carteiras.json
  def create
    @carteira = Carteira.new(carteira_params)
    respond_to do |format|
      if @carteira.save
        format.html { redirect_to carteiras_path, notice: 'Carteira was successfully created.' }
        format.json { render :show, status: :created, location: @carteira }
      else
        format.html { render :new }
        format.json { render json: @carteira.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carteiras/1
  # PATCH/PUT /carteiras/1.json
  def update
    respond_to do |format|
      if @carteira.update(carteira_params)
        format.html { redirect_to carteiras_path, notice: 'Carteira was successfully updated.' }
        format.json { render :show, status: :ok, location: @carteira }
      else
        format.html { render :edit }
        format.json { render json: @carteira.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carteiras/1
  # DELETE /carteiras/1.json
  def destroy
    @carteira.destroy
    respond_to do |format|
      format.html { redirect_to carteiras_url, notice: 'Carteira was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carteira
      @carteira = Carteira.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carteira_params
      params[:carteira].merge!(user_id: current_user.id)
      params.require(:carteira).permit(:data_da_compra, :empresa_id, :entrada, :alvo, :stop, :atual, :quantidade, :user_id, :data_da_venda, :situacao)
    end
end
