Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :verticals, except: %i[new edit]
      resources :categories, except: %i[new edit]
      resources :courses,    except: %i[new edit]
    end
  end
  root to: "application#welcome"
end
