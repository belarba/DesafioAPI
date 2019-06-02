Rails.application.routes.draw do

  get 'test', to: 'desafios#test'
  post '/input_insert', to: 'desafios#input_insert'
  get '/api/v1/desafios/event/:query', to: 'api/v1/desafios#event'

  namespace 'api' do
    namespace 'v1' do
      resources :desafios
    end
  end
end
