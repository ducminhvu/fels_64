class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word

  has_many :answers, through: :words

  # scope :total_answers, ->{|lesson_id|
  #   where("lesson_id = :lesson_id AND answer is NULL", lesson_id: lesson_id)
  # }
end
