class StudentsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	
	def index
		@students = Student.all.page(params[:page]).per(5)
	end

	def new
		@student = Student.new
	end

	def show
		@student = Student.find(params[:id])
	end

	def create
		@student = Student.new(student_params)

		if @student.save
			redirect_to @student
		else
			render 'new'
		end
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])

		if @student.update(params[:student].permit(:name, :register_number, :status))
			redirect_to @student
		else
			render 'edit'
		end
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy

		redirect_to students_path
	end

	private

	def student_params
		params.require(:student).permit(:name, :register_number, :status)
	end
end
