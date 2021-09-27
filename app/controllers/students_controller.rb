class StudentsController < ApplicationController

    def index
        students = Student.all
        render json: students
    end

    def show
        student = Student.find_by(id: params[:id])
        if student
            render json: student, status: :ok
        else
            render json: {errors: "Student not found"}
        end
    end

    def create
        student = Student.new(student_params)
        if student.save
            render json: student, status: :created
        else
            render Json: {errors: student.errors.full_messages}
        end
    end

    def destroy
        student = Student.find_by(id: params[:id])
        if student
            student.destroy
            render json: {}, status: :ok
        else
            render json: {errors: "Student not found"}, status: :not_found
        end
    end
    

    private 

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end
end
