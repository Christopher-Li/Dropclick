Rails.application.routes.draw do
  # CREATE
  get "/new_question" => "questions#new"
  get "/create_question" => "questions#create"

  # READ
  get "/questions/:id" => "questions#show"
  get "/questions" => "questions#index"

  # UPDATE
  get "/questions/:id/edit" => "questions#edit"
  get "/questions/:id/update" => "questions#update"

  # DESTROY
  get "/questions/:id/destroy" => "questions#destroy"
end
