class LoginController < ApplicationController

    def create
        user = User.find_by(name: params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.user_id
            redirect_to user_path(session[:user_id])
        else
            flash[:errors] = "Your Ship Could Not Be Found. Try another Port"
            redirect_to new_login_path
        end

    end

    def destroy

    end

end