class PostsController < ApplicationController
	include PostsHelper
	helper_method :search_params
	def index
		@posts = display_without_key_words
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

	def search
		@posts = display_with_key_words(search_params)
	end

	def search_params
<<<<<<< HEAD
		# output = []
		# params.each do |key,value|
		# 	if key.include?("search") then output << value end
		# end
    []
=======
		search_arr(params[:search])
>>>>>>> b96defa701b92057abab41fb039951bfa2a68ff1
	end
end

