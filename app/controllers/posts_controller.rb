class PostsController < ApplicationController
 
    def index
      @posts = Post.all
    end
  
    def new
      @post = Post.new  
    end
    
    def create
      @post = Post.new(post_params)    
      if params[:back]
        render :new
      else
        if @post.save
          redirect_to posts_path, notice: "投稿しました" 
        else
          render :new
        end
      end
    end
  
    def show
      @post = Post.find(params[:id]) 
    end
  
    def edit    
      @post = Post.find(params[:id])
    end 
  
    def update    
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to posts_path, notice: "投稿を編集しました"
      else
        render :edit
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy 
      redirect_to posts_path, notice:"投稿は削除されました　投稿「I'll be back」"
    end
  
    def confirm
      @post = Post.new(post_params)
      render :new if @post.invalid?  
    end
    
    private 
    def post_params 
        params.require(:post).permit(:content)
    end
  end

