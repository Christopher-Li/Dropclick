class QuestionsController < ApplicationController
	def new
		q = Question.new
		q.content = ""
		q.save
		redirect_to "/questions/#{ q.id }"
	end

	def show
		@answers = Answer.where("question_id" => params["id"])
		@question = Question.find_by("id" => params["id"])
	end

	def index
		@questions = Question.all
	end

	def edit
	end

	def update
		@question = Question.find_by("id" => params["id"])
		@question.content = params["desc"]
		@question.save
		@answers = Answer.where("question_id" => params["id"])
		counter = 0
		@answers.each do |answer|
			if params["answer#{ counter }"] != ""
				answer.content = params["answer#{ counter }"]
				answer.save
			else
				answer.delete
			end
			counter += 1
		end
		if params["new_answer"] != ""
				a = Answer.new
				a.content = params["new_answer"]
				a.question_id = params["id"]
				a.votes = 0
				a.save
		end
		redirect_to "/questions/#{ params["id"] }"
	end

	def destroy
		q = Question.find_by_id(params["id"])
		q.destroy
		redirect_to "/questions"
	end

	def answer
		@answers = Answer.where("question_id" => params["id"])
		@question = Question.find_by("id" => params["id"])
	end

	def answersubmit
		@answers = Answer.where("question_id" => params["id"])
		@answers[params["Answerchoice"].to_i].votes += 1
		@answers[params["Answerchoice"].to_i].save
		redirect_to "/questions/#{params["id"]}/answer"
	end

	def results
		@answers = Answer.where("question_id" => params["id"])
	end

end