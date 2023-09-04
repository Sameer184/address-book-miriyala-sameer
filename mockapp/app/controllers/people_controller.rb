class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.all
    respond_to do |format|
      format.html
      format.json { render json: @people }
      format.js
    end
  end

  def show
    @person = Person.find(params[:id])
    @address = @person.addresses
    @emails = @person.emails
    @phone_numbers = @person.phone_numbers

    respond_to do |format|
      format.html
      format.json { render json: @person }
      format.js
    end
  end

  def new
    @person = Person.new
    respond_to do |format|
      format.html
      format.json { render json: people }
      format.js
    end
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person }
        format.json { render json: @person, status: :created, location: @person }
        format.js
      else
        format.html { render 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
  end

  def update
    @person = Person.find(params[:id])
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person }
        format.json { render json: @person, status: :ok, location: @person }
        format.js
      else
        format.html { render 'edit' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    respond_to do |format|
      begin
        @person.destroy!
        format.html { redirect_to people_url }
        format.json { head :no_content }
        format.js
      rescue ActiveRecord::RecordNotFound
        format.html { redirect_to people_url }
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date)
  end
end

