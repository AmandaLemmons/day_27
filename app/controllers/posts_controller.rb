class PostsController < ApplicationController

  before_action do
    @posts = Post.all
                  .order("created_at desc")
                  .page(params[:page])
                  .per(6)
  end



  def new
    @post = Post.new
  end


  def create
    @post = Post.new params.require(:post).permit(:title, :photo)
      if @post.save
        redirect_to root_path, notice: "Picture Added!!"
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
