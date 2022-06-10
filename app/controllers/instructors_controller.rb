class InstructorsController < ApplicationController

   
    def index
        instructors = Instructor.all
        render json: instructors
    end

    def show
        instructor = find_instructor
        render json: instructor
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        instructor = find_instructor
        instructor.update!(instructor_params)
        render json: instructor, status: :accepted
    end

    def destroy
        instructor = find_instructor
        instructor.destroy!
        render json: instructor, status: :accepted
    end

    private

    def find_instructor
        Instructor.find(params[:id])
    end

    def instructor_params
        params.permit(:name)
    end

    
    
end
