Rails.application.routes.draw do

  get 'test', to: 'desafios#test'

  namespace 'api' do
    namespace 'v1' do
      resources :desafios
    end
  end
end
