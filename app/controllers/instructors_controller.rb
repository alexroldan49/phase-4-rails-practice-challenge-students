class InstructorsController < ApplicationController

    def index
        instructors = Instructor.all
        render json: instructors
    end

    def show
        instructor = Instructor.find_by(id: params[:id])
        render json: instructor, status: :ok
    end

    def create
        instructor = Instructor.new(instructor_params)
        if instructor.save
            render json: instructor, status: :created
        else
            render json: {errors: instructor.errors.full_messages}
        end
    end

    def destroy
        instructor = Instructor.find_by(id: params[:id])
        if instructor
            instructor.destroy
            render json: {}, status: :ok
        else
            render json: {errors: "Instructor not found"}, status: :not_found
        end
    end
    

    private

    def instructor_params
        params.permit(:name)
    end
    
end
