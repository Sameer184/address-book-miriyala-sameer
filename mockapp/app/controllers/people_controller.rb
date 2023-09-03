class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.all
    @person = Person.new
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  def create
    @person = Person.new(person_params)
    
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person }
        format.js   # This renders create.js.erb (see next step)
      else
        format.html { render 'new' }
        format.js   # This renders create.js.erb (see next step)
      end
    end
  end

  # def update
  #   @person = Person.find(params[:id])
    
  #   respond_to do |format|
  #     if @person.update(person_params)
  #       format.html { redirect_to @person }
  #       format.js   # This renders update.js.erb (see next step)
  #     else
  #       format.html { render 'edit' }
  #       format.js   # This renders update.js.erb (see next step)
  #     end
  #   end
  # end

  # def create
  #   @person = Person.new(person_params)
  #   if @person.save
  #     redirect_to people_path, notice: 'Person was successfully created.'
  #   else
  #     @people = Person.all
  #     render 'index'
  #   end
  # end

  def update
    if @person.update(person_params)
      redirect_to people_path, notice: 'Person was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    redirect_to people_url, notice: 'Person was successfully deleted.'

    # respond_to do |format|
    #   format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date)
    end
end
