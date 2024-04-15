class Like2sController < ApplicationController
    def create
        like2 = current_user.like2s.create(video_id: params[:video_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like2 = Like2.find_by(video_id: params[:video_id], user_id: current_user.id)
        like2.destroy
        redirect_back(fallback_location: root_path)
    end
end
