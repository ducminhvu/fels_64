class LessonsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show]

  def show
  end

  def create
    category = Category.find_by params[:lesson][:category_id]
    if Word.not_learn(category.id, current_user.id).count == 0
      flash[:info] = t :user_complete_all_lesson
      redirect_to root_path
    else
      lesson = current_user.lessons.create category_id: category.id
      Word.not_learn(category.id, current_user.id).limit(Settings.words_per_lesson).each do |word|
        lesson.lesson_words.create word_id: word.id
      end
      redirect_to lesson
    end
  end
end
