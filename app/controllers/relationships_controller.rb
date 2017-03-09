class RelationshipsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_user
    
    def create
        current_user.follow(@user)
        
        respond_to do |format|
            format.html { redirect_to user_path(@user.id) }
            format.js {}
        end
    end
    
    def destroy
        current_user.unfollow(@user)
        
        respond_to do |format|
            format.html { redirect_to user_path(@user.id) }
            format.js {}
        end
    end
    
    private
    
    def check_user
        @user = User.find(params[:user_id])
    end
    
end
