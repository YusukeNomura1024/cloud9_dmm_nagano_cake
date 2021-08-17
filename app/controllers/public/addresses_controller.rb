class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path


  end

  def update
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address).merge(customer_id: current_customer.id)
  end

end
