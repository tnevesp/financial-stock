require 'test_helper'

class CarteirasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carteira = carteiras(:one)
  end

  test "should get index" do
    get carteiras_url
    assert_response :success
  end

  test "should get new" do
    get new_carteira_url
    assert_response :success
  end

  test "should create carteira" do
    assert_difference('Carteira.count') do
      post carteiras_url, params: { carteira: { alvo: @carteira.alvo, atual: @carteira.atual, data_da_compra: @carteira.data_da_compra, empresa_id: @carteira.empresa_id, entrada: @carteira.entrada, quatidade: @carteira.quatidade, situacao: @carteira.situacao, stop: @carteira.stop, total_da_compra: @carteira.total_da_compra, total_da_venda: @carteira.total_da_venda } }
    end

    assert_redirected_to carteira_url(Carteira.last)
  end

  test "should show carteira" do
    get carteira_url(@carteira)
    assert_response :success
  end

  test "should get edit" do
    get edit_carteira_url(@carteira)
    assert_response :success
  end

  test "should update carteira" do
    patch carteira_url(@carteira), params: { carteira: { alvo: @carteira.alvo, atual: @carteira.atual, data_da_compra: @carteira.data_da_compra, empresa_id: @carteira.empresa_id, entrada: @carteira.entrada, quatidade: @carteira.quatidade, situacao: @carteira.situacao, stop: @carteira.stop, total_da_compra: @carteira.total_da_compra, total_da_venda: @carteira.total_da_venda } }
    assert_redirected_to carteira_url(@carteira)
  end

  test "should destroy carteira" do
    assert_difference('Carteira.count', -1) do
      delete carteira_url(@carteira)
    end

    assert_redirected_to carteiras_url
  end
end
