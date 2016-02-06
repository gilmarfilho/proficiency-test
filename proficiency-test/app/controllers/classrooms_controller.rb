class ClassroomsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@classrooms = Classroom.all.page(params[:page]).per(5)
	end
	
	def new
		@courses = Course.select("name", "id")
		@classroom = Classroom.new
	end

	def show
		@classroom = Classroom.find(params[:id])
	end

	def create
		@classroom = Classroom.new(classroom_params)

		if @classroom.save
			redirect_to @classroom
		else
			render 'new'
		end
	end

	def edit
		@classroom = Classroom.find(params[:id])
	end

	def update
		@classroom = Classroom.find(params[:id])

		if @classroom.update(params[:classroom].(:entry_at, :course_id, :student_id))
			redirect_to @classroom
		else
			render 'edit'
		end
	end

	def destroy
		@classroom = Classroom.find(params[:id])
		@classroom.destroy

		redirect_to classrooms_path
	end

	private

	def classroom_params
		params.require(:classroom).permit(:entry_at, :course_id, :student_id)
	end
end
