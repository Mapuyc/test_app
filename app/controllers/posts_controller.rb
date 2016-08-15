class PostsController < ApplicationController
	respond_to :html
    respond_to :js
    before_action :set_auth
    before_filter :authenticate_user!, except: [:home, :index]
   

    def home
    	if current_user
    		redirect_to posts_path
        end
    end

	def index
	    @post = Post.new
		@posts = Post.all.includes(:comments).order('created_at DESC')
	end

	def show
	end
    
 	def create
		@post = Post.new(post_params)
		@post.user = current_user

		if @post.save
		   redirect_to :back
		end   
	end
    
	def edit
		@post = current_user.post.find(params[:id])
	end

	def update
	    @post = current_user.post.find(params[:id])
        
	    if @post.update(params[:post].permit(:body))
	     	redirect_to :back
	    else
	     	render 'edit'
	    end
	end

	def destroy
		@post = current_user.post.find(params[:id])
		@post.destroy 

		redirect_to :back
	end



	private
	    def post_params
	    	params.require(:post).permit(:body, :user_id)
	    end

	    def set_auth
	    	@auth = session[:omniauth] if session[:omniauth]
	    end
end
