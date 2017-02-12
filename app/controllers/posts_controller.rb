class PostsController < ApplicationController
	def index
    # p request
    response.headers.except! 'X-Frame-Options'
	end
end