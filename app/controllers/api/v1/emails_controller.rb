module Api
    module V1
      class EmailsController < ApplicationController
        skip_before_action :verify_authenticity_token
        before_action :set_person
        before_action :set_email, only: [:show, :update, :destroy]
  
        # GET /api/v1/people/:person_id/emails
        def index
          @emails = @person.emails
          render json: @emails
        end
  
        # GET /api/v1/people/:person_id/emails/:id
        def show
          render json: @email
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Email not found' }, status: :not_found
        end
  
        # POST /api/v1/people/:person_id/emails
        def create
          @email = @person.emails.build(email_params)
          if @email.save
            render json: @email, status: :created
          else
            render json: @email.errors, status: :unprocessable_entity
          end
        end
  
        # PUT /api/v1/people/:person_id/emails/:id
        def update
          if @email.update(email_params)
            render json: @email
          else
            render json: @email.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /api/v1/people/:person_id/emails/:id
        def destroy
          @email.destroy
          render json: { message: 'Email deleted' }
        end
  
        private
  
        def set_person
          @person = Person.find(params[:person_id])
        end
  
        def set_email
          @email = @person.emails.find(params[:id])
        end
  
        def email_params
          params.require(:email).permit(:email_address, :comment)
        end
      end
    end
  end
  