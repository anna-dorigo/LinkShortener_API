class Link < ApplicationRecord
	validates_presence_of :lookup_code, :original_url
	validates_uniqueness_of :lookup_code
	validate :original_url_format
	validates :slug, uniqueness: true, allow_nil: true

	def original_url_format
		uri = URI.parse(original_url || "")
		if uri.host.nil?
			errors.add(:original_url, "Invalid URL format")
		end

	end

	def shortened_url
		if slug.nil?
			ENV["DOMAIN_URL"]+lookup_code
		else
			ENV["DOMAIN_URL"]+slug
		end
	end
end
