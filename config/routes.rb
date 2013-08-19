Otp::Application.routes.draw do
  resource :account
  resource :session
  root 'sessions#new'
end
