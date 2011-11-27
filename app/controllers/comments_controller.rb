class CommentsController < ApplicationController

  http_basic_authenticate_with :name => "dhh", :password => "secret", :only => :destroy
  respond_to :html, :js, :xml

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    respond_with @comment if @comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_with(@comment)
  end

end
