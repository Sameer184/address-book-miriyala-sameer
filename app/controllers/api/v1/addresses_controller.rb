module Api
    module V1
      class AddressesController < ApplicationController
        skip_before_action :verify_authenticity_token
        before_action :set_person
        before_action :set_address, only: [:show, :update, :destroy]
  
        # GET /api/v1/people/:person_id/addresses
        def index
          @addresses = @person.addresses
          render json: @addresses
        end
  
        # GET /api/v1/people/:person_id/addresses/:id
        def show
          render json: @address
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Address not found' }, status: :not_found
        end
  
        # POST /api/v1/people/:person_id/addresses
        def create
          @address = @person.addresses.build(address_params)
          if @address.save
            render json: @address, status: :created
          else
            render json: @address.errors, status: :unprocessable_entity
          end
        end
  
        # PUT /api/v1/people/:person_id/addresses/:id
        def update
          if @address.update(address_params)
            render json: @address
          else
            render json: @address.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/people/:person_id/addresses/:id
        def destroy
          @address.destroy
          render json: { message: 'Address deleted' }
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
    end
  end
  