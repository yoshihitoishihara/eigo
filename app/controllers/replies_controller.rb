class RepliesController < ApplicationController
    def create
        video = Video.find(params[:video_id])
        reply = video.replies.build(reply_params) 
        reply.user_id = current_user.id
        if reply.save
          flash[:success] = "コメントしました"
          redirect_back(fallback_location: root_path)
        else
          flash[:success] = "コメントできませんでした"
          redirect_back(fallback_location: root_path)
        end
      end
    
    private
    
    def reply_params
      params.require(:reply).permit(:content)
    end
end
