class LoginController < ApplicationController
  skip_before_action :check_login, except: [:successful_login]

  def new_user
    render "/login/new_user"
  end

  def process_registration
   @user=User.create(user_params)
      if @user.valid?
        flash[:notice] = ['Welcome' + @user.name + @user.alias + @user.email]
        session[:user_id] = @user.id
        redirect_to "/idea/display_ideas" and return
      else
        @user.errors.full_messages.each do |msg|
          flash[:error] = [msg]
        end
      redirect_to "/login" and return
      end
  end

  def process_login

    if @user=User.find_by_email(user_params[:email]).try(:authenticate, user_params[:password] )    
      flash[:notice] = ['Welcome to the system ' + @user.name +  " " + @user.alias +  " " + @user.email]
      session[:user_id] = @user.id
      redirect_to "/idea/display_ideas" and return
    else 
      flash[:notice] = ['Unable to process this userid and password combination']
    end

    redirect_to "/login" and return

  end


  def edit_user

    @user=User.find(params[:id])
    render "login/edit_user"

  end

  def process_edit

    user=User.find(params[:id])
    user.update(user_params)
    if user.valid?
      flash[:notice] = ['Successful update of your user record ' + user.name + " " + user.alias ]
    else
      flash[:notice] = ['There was a problem updating your user record ' + user.name + " " + user.alias]
    end

    redirect_to "/login" and return

  end

  def logout

    @user=User.find(session[:user_id])
    flash[:notice] = ['Thanks for visiting Secrets ' + @user.name]
    session[:user_id] = nil 

    redirect_to "/login" and return  

  end

  private

  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end


end
