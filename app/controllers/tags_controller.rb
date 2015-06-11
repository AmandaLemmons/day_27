class TagsController < ApplicationController
  def show
    tag_name = params[:tag]
    @posts = Post.tagged_with(tag_name)
                 .order("created_at desc")
                 .page
  end
end
