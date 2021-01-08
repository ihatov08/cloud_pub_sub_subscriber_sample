Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "health_check" => "health_check#index"
      resources :subscribe_logs, only: %i[index]
      namespace :cloud_pub_sub do
        resources :subscribe, only: %i[create]
      end
    end
  end
end
