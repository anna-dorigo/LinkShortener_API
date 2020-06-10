class V1::LinksController < ApplicationController

	def index
		@links = Link.all

		render json:@links, status: :ok
	end

end
