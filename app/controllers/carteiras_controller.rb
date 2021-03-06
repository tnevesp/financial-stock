class CarteirasController < ApplicationController
  before_action :set_carteira, only: [:show, :edit, :update, :destroy]

  # GET /carteiras
  # GET /carteiras.json
  def index
    if params[:situacao].blank?
      @carteiras = Carteira.joins(:empresa).where(situacao: 'em_andamento').order('empresas.ticker asc, carteiras.data_da_compra asc')
    elsif params[:situacao] == 'todos'
      @carteiras = Carteira.all.order(data_da_compra: :asc, id: :desc)
      @carteiras = Carteira.joins(:empresa).where(['empresas.ticker = ?', 'PETR4'])
    else
      # .where(["to_char(data_da_venda, 'MM/YYYY') = ?", "01/2018"])
      @carteiras = Carteira.where(situacao: params[:situacao]).joins(:empresa)#.where(['empresas.ticker = ?', 'PETR4']) #.where(["to_char(data_da_venda, 'MM/YYYY') = ?", "03/2018"])
      @carteiras = @carteiras.where(["to_char(data_da_venda, 'MM/YYYY') = ?", params[:filtro]['data_de_encerramento'] ]) if params[:filtro] && params[:filtro]['data_de_encerramento']
      @carteiras.order(data_da_venda: :asc, id: :desc)
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

  def atualizar_precos
    AtualizacaoDePrecoService.executar
    redirect_to carteiras_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carteira
      @carteira = Carteira.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carteira_params
      params[:carteira].merge!(user_id: current_user.id)
      params.require(:carteira).permit(:data_da_compra, :empresa_id, :entrada, :alvo, :stop, :atual, :quantidade, :user_id, :data_da_venda, :situacao, :corretora_id, :tipo_de_operacao_id, :observacao)
    end
end
