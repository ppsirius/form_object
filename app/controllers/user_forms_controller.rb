class UserFormsController < ApplicationController
  
  def new
    @user_form = UserForm.new
  end
  
  def create 
    @user_form = UserForm.new
    if @user_form.submit(user_forms_params)
      flash[:notice] = 'SUCCESS'
      redirect_to '/'
    else
      flash[:error] = "FAILURE"
      render :new
    end
  end

  private

  def user_forms_params
    params.require(:user_form).
      permit(:login, :email, :city,
        :postal_code, :street, :display_name, :weather)
  end

end
