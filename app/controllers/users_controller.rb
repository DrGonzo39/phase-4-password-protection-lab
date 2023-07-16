class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        if user.valid? 
            session[:user_id] = user.id 
            render json: user, status: :created 
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable entity
        end
    end

    def show
        user = User.find_by(id: sessions[:user_id])
        render json: user 
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end
