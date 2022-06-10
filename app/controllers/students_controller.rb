class StudentsController < ApplicationController
    def index
        students = Student.all
        render json: students, include: ['instructor']
    end

    def show
        student = Student.find(params[:id])
        render json: student, include: ['instructor']
    end

    def create
        student = Student.create!(student_params)
        render json: student
    end

    def update
        student = Student.find(params[:id])
        student.update!(student_params)
        render json: student
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy!
        render json: student
    end

    private 

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

end