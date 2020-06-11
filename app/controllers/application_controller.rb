class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
	def record_not_found
    	render json: {
				error_message: 'Record not found'
		}
  	end

	def redirect
		url_string = params[:lookup_code]
		if url_string.chr == "_"
			link = Link.find_by(lookup_code: url_string)
		else
			link = Link.find_by(slug: url_string)
		end

		if link.status
			redirect_to link.original_url
		else
			render "page_inactive"
		end
	end
end
