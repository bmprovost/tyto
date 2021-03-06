require 'ostruct'
require 'active_model'

require_relative 'tyto/entity.rb'
require_relative 'tyto/entities/assignment.rb'
require_relative 'tyto/entities/course.rb'
require_relative 'tyto/entities/chapter.rb'
require_relative 'tyto/entities/class.rb'
require_relative 'tyto/entities/question.rb'
require_relative 'tyto/entities/response.rb'
require_relative 'tyto/entities/session.rb'
require_relative 'tyto/entities/student.rb'
require_relative 'tyto/entities/teacher.rb'
require_relative 'tyto/entities/invite.rb'
require_relative 'tyto/entities/message.rb'

require_relative 'tyto/database/activerecord.rb'

require_relative 'tyto/database/crud/assignment.rb'
require_relative 'tyto/database/crud/chapter.rb'
require_relative 'tyto/database/crud/classroom.rb'
require_relative 'tyto/database/crud/course.rb'
require_relative 'tyto/database/crud/invite.rb'
require_relative 'tyto/database/crud/message.rb'
require_relative 'tyto/database/crud/question.rb'
require_relative 'tyto/database/crud/response.rb'
require_relative 'tyto/database/crud/session.rb'
require_relative 'tyto/database/crud/student.rb'
require_relative 'tyto/database/crud/teacher.rb'

require_relative 'tyto/database/joins/classrooms_users.rb'
require_relative 'tyto/database/joins/users_questions.rb'

require_relative 'tyto/database/queries/assignment.rb'
require_relative 'tyto/database/queries/chapter.rb'
require_relative 'tyto/database/queries/classroom.rb'
require_relative 'tyto/database/queries/course.rb'
require_relative 'tyto/database/queries/invite.rb'
require_relative 'tyto/database/queries/message.rb'
require_relative 'tyto/database/queries/question.rb'
require_relative 'tyto/database/queries/response.rb'
require_relative 'tyto/database/queries/student.rb'
require_relative 'tyto/database/queries/teacher.rb'

require_relative 'tyto/database/statistics/proficiency.rb'
require_relative 'tyto/database/statistics/streaks.rb'

require_relative 'tyto/use_case.rb'
require_relative 'tyto/use_cases/answer_question.rb'
require_relative 'tyto/use_cases/sign_in.rb'
require_relative 'tyto/use_cases/student_sign_up.rb'
require_relative 'tyto/use_cases/teacher_sign_up.rb'
require_relative 'tyto/use_cases/assign_homework.rb'
require_relative 'tyto/use_cases/add_students_to_class.rb'
require_relative 'tyto/use_cases/accept_invite.rb'
require_relative 'tyto/use_cases/update_teacher.rb'
require_relative 'tyto/use_cases/update_student.rb'

module Tyto
  def self.db
    @__db_instance ||= @db_class.new(@env || 'test')
  end

  def self.db_class=(db_class)
    @db_class = db_class
  end

  def self.env=(env_name)
    @env = env_name
  end
end
