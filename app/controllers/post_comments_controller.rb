class PostCommentsController < ApplicationController

  def create
    post_iamge = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_iamge.id
    comment.save
    redirect_to post_image_path(post_iamge)
  end

  def destory
    PostComment.find(params[:id]).destory
    redirect_to post_image_path(params[:post_image_id])
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end


end
