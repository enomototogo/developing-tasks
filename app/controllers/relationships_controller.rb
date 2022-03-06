class RelationshipsController < ApplicationController
    def create
        current_user.follow(params[:user_id])
        redirect_to request.referer
    end
    
    def destroy
        current_user.unfollow(params[:user_id])
        redirect_to request.referer
    end
    
    def followings
        @user = User.find(params[:user_id])
        @following_users = @user.followings.all
    end
    
    def followers
        @user = User.find(params[:user_id])
        @followed_users = @user.followers.all
    end
   
end