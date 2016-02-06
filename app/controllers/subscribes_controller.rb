class SubscribesController < ApplicationController
	def index
		@classrooms = Classroom.select(:id, :name).joins(:course)
		@students = Student.all
	end
	
	def save
		@classroom = Classroom.find(1)
		student = Student.find(1)
		@classroom.student_id[@classroom.student_id.size] = student.id
		@classroom.entry_at[@classroom.entry_at.size] = Date.current
		if @classroom.save
			redirect_to @classroom
		else
			render 'index'
		end
	end
end
