class CoursesController < ApplicationController
	def index
		@courses = Course.all.order('created_at DESC')
	end

	def new
		@course = Course.new
	end

	def show
		@course = Course.find(params[:id])
	end

	def create
		@course = Course.new(course_params)

		if @course.save
			redirect_to @course
		else
			render 'new'
		end
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])

		if @course.update(params[:course].permit(:name, :register_number, :status)
			redirect_to @course
		else
			render 'edit'
		end
	end

	def destroy
		@course = Course.find(params[:id])
		@course.destroy

		redirect_to courses_path
	end

	private

	def course_params
		params.require(:course).permit(:name, :description, :status)
	end
end
