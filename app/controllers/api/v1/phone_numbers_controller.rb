module Api
    module V1
      class PhoneNumbersController < ApplicationController
        skip_before_action :verify_authenticity_token
        before_action :set_person
        before_action :set_phone_number, only: [:show, :update, :destroy]
  
        # GET /api/v1/people/:person_id/phone_numbers
        def index
          @phone_numbers = @person.phone_numbers
          render json: @phone_numbers
        end
  
        # GET /api/v1/people/:person_id/phone_numbers/:id
        def show
          render json: @phone_number
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Phone number not found' }, status: :not_found
        end
  
        # POST /api/v1/people/:person_id/phone_numbers
        def create
          @phone_number = @person.phone_numbers.build(phone_number_params)
          if @phone_number.save
            render json: @phone_number, status: :created
          else
            render json: @phone_number.errors, status: :unprocessable_entity
          end
        end
  
        # PUT /api/v1/people/:person_id/phone_numbers/:id
        def update
          if @phone_number.update(phone_number_params)
            render json: @phone_number
          else
            render json: @phone_number.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/people/:person_id/phone_numbers/:id
        def destroy
          @phone_number.destroy
          render json: { message: 'Phone number deleted' }
        end
  
        private
  
        def set_person
          @person = Person.find(params[:person_id])
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Person not found' }, status: :not_found
        end
  
        def set_phone_number
          @phone_number = @person.phone_numbers.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Phone Number not found' }, status: :not_found
        end
  
        def phone_number_params
          params.require(:phone_number).permit(:phone_number, :comment)
        end
      end
    end
  end
