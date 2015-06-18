class PostsController < ApplicationController

  before_action do
    @posts = Post.all
                  .order("created_at desc")
                  .page(params[:page])

    if @current_user.nil?
      redirect_to sign_in_path
    end

  end

  def index
    @post = Post.new
  end


  def new
    @post = Post.new
  end


  def create
    @post = Post.new params.require(:post).permit(:title, :photo, :tag_list)
      if @post.save
        redirect_to root_path
      else
        render :new
      end
  end

  def delete
    @post = Post.find params[:id]
    @post.destroy
    redirect_to root_path
  end

end
