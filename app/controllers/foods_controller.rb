class FoodsController < ApplicationController
  before_action :login_check, :current_cart
  skip_before_action  :login_check, :only => [:posts, :posts_category, :show]

  def posts
      @posts = Post.all
  end

  def posts_category
    case params[:category]
    when "soju"
      @category = "소주"
    when "vodka"
      @category = "보드카"
    else
      @category = "와인"
   end
     @posts = Post.where(category: @category)
    
  end
 
  def show
     @post = Post.find(params[:id])
  @comment_writer = User.where(id: session[:user_id])[0]
  end

  def write

  end

  def write_complete
    post = Post.new
    post.user_id = session[:user_id]
    post.category = params[:post_category]
    post.title = params[:post_title]
    post.content = params[:post_content]
    if post.save
      flash[:alert] = "저장되었습니다."
      redirect_to "/foods/show/#{post.id}"
    else
      flash[:alert] = post.errors.values.flatten.join(' ')
      redirect_to :back
    end
  end

  def edit
  @post = Post.find(params[:id])
  end

  def edit_complete
    post = Post.find(params[:id])
    post.category = params[:post_category]
    post.title = params[:post_title]
    post.content = params[:post_content]
    if post.save
      flash[:alert] = "수정되었습니다."
      redirect_to "/foods/show/#{post.id}"
    else
      flash[:alert] = post.errors.values.flatten.join(' ')
      redirect_to :back
    end
  end

  def delete_complete
    post = Post.find(params[:id])
    post.destroy
    flash[:alert] = "삭제되었습니다."
    redirect_to "/foods/posts"
  end

  def write_comment_complete
    comment = Comment.new
    comment.user_id = session[:user_id]
    comment.post_id = params[:post_id]
    comment.content = params[:comment_content]
    comment.save

    flash[:alert] = "새 댓글을 달았습니다."
    redirect_to "/foods/show/#{comment.post_id}"
  end
 
  def delete_comment_complete
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:alert] = "댓글이 삭제되었습니다."
    redirect_to "/foods/show/#{comment.post_id}"
  end
end