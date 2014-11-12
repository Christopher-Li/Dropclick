class QuestionsController < ApplicationController
	def new
		# q = Question.new
		# q.save
		redirect_to "/questions/#{ q.id }"
	end

	def create
	end

	def show
		if params["new_answer"]
			a = Answer.new
			a.content = params["new_answer"]
			a.question_id = params["id"]
			a.save
		end
		@answers = Answer.where("question_id" => params["id"])
		if Question.find_by("id", params["id"])
			@question = Question.find_by("id", params["id"])
		end
	end

	def index
	end

	def edit
	end

	def update
		@question = Question.find_by("id", params["id"])
		@question.content = params["desc"]
		@question.save
		@answers = Answer.where("question_id" => params["id"])
		counter = 0
		@answers.each do |answer|
			if params["answer${ counter }"]
				answer.content = params["answer${ counter }"]
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
				a.save
		end
		redirect_to "/questions/#{ params["id"] }"
	end

	def destroy
	end

end