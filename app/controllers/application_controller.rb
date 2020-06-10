class ApplicationController < ActionController::API
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
