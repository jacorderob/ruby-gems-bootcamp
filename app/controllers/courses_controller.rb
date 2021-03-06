# frozen_string_literal: true

# Courses controller
class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy]

  def index
    @courses = @ransack_courses.result.includes(:user)
  end

  def show; end

  def new
    @course = Course.new
  end

  def edit; end

  def create
    @course = Course.new(course_params)
    @course.user = current_user

    respond_to do |format|
      if @course.save
        format.html do
          redirect_to @course,
                      notice: 'Course was successfully created.'
        end
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @course.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html do
          redirect_to @course,
                      notice: 'Course was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @course.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html do
        redirect_to courses_url,
                    notice: 'Course was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_course
    @course = Course.friendly.find(params[:id])
  end

  def course_params
    params.require(:course).permit(
      :title, :description, :short_description, :price, :language, :level
    )
  end
end
