class UsersController < ApplicationController

    # def index
    #     User.all
    #     render :index
    # end
    
    def create
        @user = User.new(users_params)
        if @user && @user.save
            login(@user)
            flash[:messages] = ["Account created and login successful"]
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end

    # def edit
    #     @user = User.find_by_credentials #find_by(id: params[:id])
    #     render :edit
    # end

    def show
        @user = User.find_by_credentials(params[:email], params[:password])
        render :show
    end

    # def update
    #     user = User.find_by_credentials
    #     if user.update(users_params)
    #         redirect_to user_url(user)
    #     else
    #         flash.now[:errors] = user.errors.full_messages
    #         render :new
    #     end
    # end

    # def destroy
    #     logout
    #     redirect_to new_session_url
    # end
    
    private
    def users_params
        params.require(:user).permit(:email, :password)
    end
end