class CommentsController < ApplicationController
   
   before_action :find_commentable, :authenticate_user!

	def create
		    
    @comment = @commentable.comments.new comment_params
   
    
     if @comment.save
       respond_to do |format|
       
       format.js {redirect_to :back}
       end
     end 
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find(params[:post_id]) if params[:post_id]
    end
end