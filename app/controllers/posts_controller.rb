class PostsController < ApplicationController
	def index
    response.headers.except! 'X-Frame-Options'
	end

	def create
		p params
	end
end
