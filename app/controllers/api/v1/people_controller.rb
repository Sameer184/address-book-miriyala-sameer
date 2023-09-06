module Api
    module V1
      class PeopleController < ApplicationController
        skip_before_action :verify_authenticity_token
        before_action :set_person, only: [:show, :update, :destroy]
  
        # GET /api/v1/people
        def index
          @people = Person.all
          render json: @people
        end
  
        # GET /api/v1/people/:id
        def show
          render json: @person
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Person not found' }, status: :not_found
        end
  
        # POST /api/v1/people
        def create
          @person = Person.new(person_params)
          if @person.save
            render json: @person, status: :created
          else
            render json: @person.errors, status: :unprocessable_entity
          end
        end
  
        # PUT /api/v1/people/:id
        def update
          if @person.update(person_params)
            render json: @person
          else
            render json: @person.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/people/:id
        def destroy
          @person = Person.find(params[:id])
          @person.destroy
          render json: { message: 'Person deleted' }
        end
  
        private
  
        def set_person
          @person = Person.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Person not found' }, status: :not_found
        end
  
        def person_params
          params.require(:person).permit(:salutation, :first_name, :middle_name, :last_name, :ssn, :birth_date)
        end
      end
    end
  end
  