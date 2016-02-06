class SubscribesController < ApplicationController
	def index
		@classrooms = Classroom.select(:id, :name).joins(:course)
		@students = Student.all
	end

	def save
		redirect_to Classroom.find(:classroom_id)
	end
end
