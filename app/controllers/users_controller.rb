class UsersController < ApplicationController
    def index
        @users = User.all
    end
    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user = User.new(user_params)

        if @user.save
            redirect_to user_path(@user)
        else
            render :new
         end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update
            flash.notice("#{@user.username} has been edited!")
            redirect_to user_path(@user)
        else
            render :edit
        end

    end

    private

    def user_params
        params.permit(:username, :email, :password)
    end
end
