class AddressesController < ApplicationController
  before_action :set_person
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = @person.addresses
  end

  def show
  end

  def new
    @address = @person.addresses.build
    @countries = JSON.parse(File.read(Rails.root.join('config', 'countries.json')))
  end

  def create
    @address = @person.addresses.build(address_params)
    if @address.save
      respond_to do |format|
        format.html { redirect_to person_addresses_path(@person), notice: 'Address was successfully created.' }
        format.js
      end
    else
      render 'new'
    end
  end

  def edit
    @countries = JSON.parse(File.read(Rails.root.join('config', 'countries.json')))
  end

  def update
    if @address.update(address_params)
      respond_to do |format|
        format.html { redirect_to person_addresses_path(@person), notice: 'Address was successfully updated.' }
        format.js
      end
    else
      render 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to person_addresses_path(@person), notice: 'Address was successfully deleted.'
  end

  private

  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_address
    @address = @person.addresses.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street, :town, :zip_code, :state, :country)
  end
end
