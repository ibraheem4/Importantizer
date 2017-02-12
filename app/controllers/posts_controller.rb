class PostsController < ApplicationController
	include PostsHelper
	helper_method :search_params
	def index
		@posts = display_with_key_words(search_params)
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



	def search_params
		output = []
		params.each do |key,value|
			if key.inlcude?("search") then output << value end
		end
	end
end
