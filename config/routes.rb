Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :picture_boards
      resources :boards
      resources :users
      resources :pictures
      get '/pictures/page/:page_num', to: 'pictures#get_page'
      get '/users/search/:search_term', to: 'users#search_users'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
