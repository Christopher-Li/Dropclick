Rails.application.routes.draw do
  # CREATE
  get "/new_question" => "questions#new"

  # READ
  get "/questions" => "questions#index"

  # UPDATE
  get "/questions/:id" => "questions#show"
  get "/questions/:id/update" => "questions#update"

  # SHOW RESULTS
  get "/questions/:id/results" => "questions#results"

  # DESTROY
  get "/questions/:id/destroy" => "questions#destroy"

  # Answer
  get "/questions/:id/answer" => "questions#answer"
  get "/questions/:id/answersubmit" => "questions#answersubmit"
end
