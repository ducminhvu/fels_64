class StaticPagesController < ApplicationController
  def home
    @lesson = Lesson.new
  end

  def help
  end

  def about
  end

  def contact
  end
end
