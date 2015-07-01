class Word < ActiveRecord::Base
  belongs_to :category
  has_many :lesson_words, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :jp_word, presence: true

  scope :located_in, ->category{where category_id: category.id}
end
