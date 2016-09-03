class ContactsController < ApplicationController
  def index
  end

  def save
    @contact = Contact.new
    @contact.given_name = params[:given_name]
    @contact.family_name = params[:family_name]
    @contact.email = params[:email]
    @contact.address = params[:address]
    if @contact.save
      flash.now[:alert] = "Your contact #{@contact.given_name} #{@contact.family_name} has been saved."
      render '/contacts/index'
    else
      flash.now[:alert] = "Your contact did not save. Try again."
      render '/contacts/index'
    end
  end

  def view
    @all_contacts = Contact.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.given_name = params[:given_name]
    @contact.family_name = params[:family_name]
    @contact.email = params[:email]
    @contact.address = params[:address]

    if @contact.given_name != params[:given_name] || @contact.family_name != params[:family_name] || @contact.email = params[:email] || @contact.address = params[:address]
      @contact.save
    end

    render 'edit.html.erb'
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:alert] = "Your contact has been deleted."
    redirect_to '/contacts/view'
  end
end
