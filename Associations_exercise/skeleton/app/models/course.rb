# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  instructor_id :integer
#  prereq_id     :integer
#
class Course < ApplicationRecord

        # belongs_to :users,
        # class_name: :User,
        # foreign_key: :

        has_many :enrollments,
        foreign_key: :course_id,
        class_name: :Enrollment,
        primary_key: :id

        has_many :enrolled_students,
        through: :enrollments,
        source: :users
        
        belongs_to :prerequisite,
        foreign_key: :prereq_id,
        class_name: :Course,
        primary_key: :id,
        optional: true

        belongs_to :instructor,
        foreign_key: :instructor_id,
        primary_key: :id,
        class_name: :User

end
