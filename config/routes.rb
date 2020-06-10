Rails.application.routes.draw do
	namespace :v1 do
		resources :links
	end
	get "/s/:lookup_code" => "application#redirect"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
