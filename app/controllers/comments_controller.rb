class CommentsController < ApplicationController

	before_action :require_login, except: [:create]

	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]

		@comment.save

		flash.notice = "Comment posted!"

		redirect_to article_path(@comment.article)
	end

	private

	def comment_params
		params.require(:comment).permit(:author, :body)
	end

end
