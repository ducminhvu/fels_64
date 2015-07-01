class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word

  has_many :answers, through: :words
end
