Rails.application.routes.draw do
  resources :report
  get 'report/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'report#index'
   match 'search_product',to: 'report#search', via: :post
   match 'export_report',to: 'report#export', via: :post
   match 'show_json',to: 'report#show_json', via: :get
end
