class CommentsController < ApplicationController
  before_action :comments_params, only: [:create, :destroy]

  def create
    @comment = @post.comments.create(params[:comment].permit(:name, :body))

    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
    def comments_params
      @post = Post.find(params[:post_id])
    end
end
