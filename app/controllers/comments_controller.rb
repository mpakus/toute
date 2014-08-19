class CommentsController < ApplicationController
    def index
        @comments = Comment.all
    end

    def show
        @comments = Comment.find(params[:id])
    end

    def new
        @comment = Comment.new
    end

    def create
	@tout = Tout.find(params[:tout_id])
	@comment = @tout.comments.create(comment_params)
	@comment.user = current_user()
	@comment.save
	redirect_to tout_path(@tout)
    end

    def edit

    end

    def update

    end

    def destroy
	@tout = Tout.find(params[:tout_id])
	@comment = @tout.comments.find(params[:id])
	@comment.destroy
	redirect_to tout_path(@tout)
    end

private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
