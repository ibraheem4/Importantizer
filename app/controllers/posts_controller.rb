class PostsController < ApplicationController
	def index
    response.headers.except! 'X-Frame-Options'
	end

	def create
		@user_id = params['from']
		@text = params['text']
		sleep(2)
		@imp =  Important.find_by(text: @text)

		if @text == nil
			Post.create(text: @text, user_id: @user_id)
		end
	end
end
