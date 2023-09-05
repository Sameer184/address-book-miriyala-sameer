class PhoneNumbersController < ApplicationController
  before_action :set_person
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]

  def index
    @phone_numbers = @person.phone_numbers
  end

  def show
  end

  def new
    @phone_number = @person.phone_numbers.build
  end

  def create
    @phone_number = @person.phone_numbers.build(phone_number_params)
    respond_to do |format|
      if @phone_number.save
        format.html { redirect_to person_phone_numbers_path(@person), notice: 'Phone number was successfully created.' }
        format.js
      else
        format.html { render 'new' }
        format.js { render json: @phone_number.errors }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @phone_number.update(phone_number_params)
        format.html { redirect_to person_phone_numbers_path(@person), notice: 'Phone number was successfully updated.' }
        format.js
      else
        format.html { render 'edit' }
        format.js { render json: @phone_number.errors }
      end
    end
  end

  def destroy
    @phone_number.destroy
    respond_to do |format|
      format.html { redirect_to person_phone_numbers_path(@person), notice: 'Phone number was successfully deleted.' }
      format.js
    end
  end

  private

  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_phone_number
    @phone_number = @person.phone_numbers.find(params[:id])
  end

  def phone_number_params
    params.require(:phone_number).permit(:phone_number, :comment)
  end
end
