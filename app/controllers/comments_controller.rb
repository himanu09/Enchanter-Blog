class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user # Associate the comment with the current user
    if @comment.save
      redirect_to article_path(@article)
    else
      # Handle the case where the comment fails to save
      flash[:alert] = "There was an issue saving your comment."
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.user == current_user || current_user.admin?
      @comment.destroy
      redirect_to article_path(@article), status: :see_other
    else
      flash[:alert] = "You are not authorized to delete this comment."
      redirect_to article_path(@article)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :status)
    end
end
