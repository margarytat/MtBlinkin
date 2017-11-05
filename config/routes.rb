Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  scope module: :alert do 
		resources :alerts
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
