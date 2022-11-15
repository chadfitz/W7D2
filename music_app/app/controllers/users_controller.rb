class UserController < ApplicationController

    def new
        @user = User.new
        render :new
    end
    
    def create
        
    end
end