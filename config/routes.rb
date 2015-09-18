Rails.application.routes.draw do

  root "posts#index"

  resources :posts do
    member do
      put 'like', to: "posts#upvote"
      put 'dislike', to: "posts#downvote"
    end
  end
end
