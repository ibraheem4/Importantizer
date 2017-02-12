class PostsController < ApplicationController
	include PostsHelper
	helper_method :search_params
	def index
		@posts = display_without_key_words
		response.headers.except! 'X-Frame-Options'

	end

	def create
		@user_id = params['from']
		@text = params['text']
		sleep(2)
		@imp =  Important.find_by(text: @text)

		if @imp == nil
			Post.create(text: @text, user_id: @user_id)
		end
	end

	def search
    response.headers.except! 'X-Frame-Options'
		@posts = display_with_key_words(search_params)
    @params = search_params()
    p 'test' * 10
		respond_to do |format|
			format.js {}
			format.html {render 'index'}
		end
	end

	def sms
		@posts = Important.all
    message =  @posts.map(&:text).join(" ")
		send_message(ENV['NUMBER'], message)
		respond_to do |format|
			format.js {}
		end
	end

	def search_params

		search_arr(params[:search])
	end

  def summary
    respond_to do |format|
      format.js
    end
  end
end
