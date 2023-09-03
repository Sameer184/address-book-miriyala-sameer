class EmailsController < ApplicationController
  before_action :set_person
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def index
    @emails = @person.emails
  end

  def show
  end

  def new
    @email = @person.emails.build
  end

  def create
    @email = @person.emails.build(email_params)
    respond_to do |format|
      if @email.save
        format.html { redirect_to person_emails_path(@person), notice: 'Email was successfully created.' }
        format.js
      else
        format.html { render 'new' }
        format.js
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to person_emails_path(@person), notice: 'Email was successfully updated.' }
        format.js
      else
        format.html { render 'edit' }
        format.js
      end
    end
  end

  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to person_emails_path(@person), notice: 'Email was successfully deleted.' }
      format.js
    end
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
