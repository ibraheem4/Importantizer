class PostsController < ApplicationController
	def index
    response.headers.except! 'X-Frame-Options'
	end

	def create
		p @user_id = params['from']
		p @text = params['text']
		sleep(2)
		@imp =  Important.find_by(text: @text)

		if @imp == nil
			Post.create(text: @text, user_id: @user_id)
		end
	end
end
