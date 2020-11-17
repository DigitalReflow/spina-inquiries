Spina::Engine.routes.draw do
  resources :inquiries, path: "contact"
  get "/thank-you", to: "inquiries#thanks"

  namespace :admin do
    resources :inquiries, only: %w[index show destroy] do
      collection do
        get :read
      end

      member do
        patch :mark_as_read
      end
    end
  end
end
