# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(student_search)
    clean_student = sanitize(student_search).downcase.gsub("'", "")
    search = "%#{clean_student}%"
    self.where(['name LIKE ?', search])
  end
end
