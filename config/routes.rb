Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :goals
      resources :activities
    end
  end
end