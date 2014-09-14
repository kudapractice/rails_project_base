Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "registrations"} do
    get 'logout' => 'devise/sessions#destroy'
  end
  
  authenticated :user do
    # root :to => 'posts#index'
    root :to => 'activities#index'
  end
  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/registrations#new", as: 'welcome'
    end
  end

  # root to: '/'

end
