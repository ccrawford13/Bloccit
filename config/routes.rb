Rails.application.routes.draw do
  
    # resources :advertisement
    get 'index' => 'advertisement#index'

    get 'show' => 'advertisement#show'

    get 'about' => 'welcome#about'

    get 'contact' => 'welcome#contact'

    resources :posts
  root to: 'welcome#index'
end
