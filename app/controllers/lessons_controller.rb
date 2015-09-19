class LessonsController < ApplicationController
 before_action :authenticate_user!
 before_action :require_course_enrollment_for_lesson, :only => [:show]

	
	def show
	end

	private

	 def require_course_enrollment_for_lesson
	 	this_course = current_lesson.section.course
		if !current_lesson.section.course.user.enrolled_in?(this_course) 
		redirect_to course_path(this_course), alert: 'Enroll now'

    end
end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end

end

