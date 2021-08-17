class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
    @submit_text = '新規登録'
  end

  def edit
    @address = Address.find(params[:id])
    @submit_text = '変更内容を保存'
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address).merge(customer_id: current_customer.id)
  end

end
