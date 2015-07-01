class Word < ActiveRecord::Base
  belongs_to :category
  has_many :lesson_words, dependent: :destroy
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: lambda {|attribute| attribute[:answer_content].blank?}

  validates :jp_word, presence: true
  validates :category_id, presence: true

  scope :located_in, ->category{where category_id: category.id}
  scope :filter_category, ->category{where category: category if category.present?}
  scope :learned, lambda{|category_id, user_id|
    where(Settings.query.learned, category_id: category_id, user_id: user_id)
  }
  scope :not_learn, lambda{|category_id, user_id|
    where(Settings.query.word_not_learn, category_id: category_id, user_id: user_id)
  }
end
