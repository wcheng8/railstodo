Rails.application.routes.draw do
  resources :todolists do
    resources :todoitems do
      member do
        patch :complete
      end
    end
  end
  root "todolists#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
