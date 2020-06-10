class V1::LinksController < ApplicationController

	def index
		@links = Link.all

		render json:@links, status: :ok
	end

	def show
		@link = Link.find(params[:id])
		puts "-------------------------"
		puts ENV["DOMAIN_URL"]
    	render json: @link, :methods => :shortened_url
  	end

	def create

		original_url = params[:original_url]
	    slug = params[:slug]
	    lookup_code_string = lookup_code()

	    if slug == ""
	    	@link = Link.create(original_url: original_url, lookup_code: lookup_code_string)
	    else
	    	@link = Link.create(original_url: original_url, lookup_code: lookup_code_string, slug: slug)
	    end 

	    if @link.save
	    	render json: @link, status: :created
	    else
	    	render json: @link.errors, status: :unprocessable_entity
	    end
	end

	def destroy
		@link = Link.where(id: params[:id]).first

		if @link.destroy
	    	head(:ok)
	    else
	    	render json: @link.errors, status: :unprocessable_entity
	    end
	end



	private

	def lookup_code
    	loop do
    		code = get_fresh_code()
     		break code unless Link.exists?(lookup_code: code)
    	end 
  	end

	def check_params
		params.require(:original_url).permit(:slug)
	end

	def get_fresh_code()
    	"_"+SecureRandom.uuid[0..5]
  	end

end
