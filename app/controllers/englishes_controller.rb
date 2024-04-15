class EnglishesController < ApplicationController
    before_action :authenticate_user!
    def index
      if params[:search] == nil
        @englishes= English.all
      elsif params[:search] == ''
        @englishes= English.all
      else
        #部分検索
        @englishes = English.where("body LIKE ? ",'%' + params[:search] + '%')
      end
      if params[:tag_ids]
        @englishes = []
        params[:tag_ids].each do |key, value|      
          @englishes += Tag.find_by(name: key).englishes if value == "1"
        end
        @englishes.uniq!
      end
      if params[:tag_ids]
        @englishes = []
        params[:tag_ids].each do |key, value|
          if value == "1"
            tag_englishes = Tag.find_by(name: key).englishes
            @englishes = @englishes.empty? ? tag_englishes : @englishes & tag_englishes
          end
        end
      end
    end

    def new
        @english = English.new
    end

    def create
        @english = English.new(english_params)
        @english.user_id = current_user.id
        if @english.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
    
    def show
        @english = English.find(params[:id])
        @comments = @english.comments
        @comment = Comment.new
    end

    def edit
        @english = English.find(params[:id])
    end

    def update
        english = English.find(params[:id])
        if english.update(english_params)
          redirect_to :action => "show", :id => english.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        english = English.find(params[:id])
        english.destroy
        redirect_to action: :index
    end

    private

    def set_english
        @english = English.find(params[:id])
    end

    def english_params
        params.require(:english).permit(:body, :image, :topic, :youtube_url, tag_ids: [])
    end
end
