Rails.application.routes.draw do
  resources :report
  get 'report/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'report#index'
  # match 'search_product',to: 'report#search', via: :post
   match 'export_report',to: 'report#export', via: :post
   match 'create_job', to: 'report#createjob',via: :put

   match 'edit_job', to: 'report#editjob',via: :get
end
