Rails.application.routes.draw do
  
    get 'about' => 'welcome#about'
    get 'contact' => 'welcome#contact'
    resources :advertisements
    resources :posts
  root to: 'welcome#index'
end
 