class Movie < ApplicationRecord
  has_many :bookmarks
  before_destroy :check_has_no_bookmark

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  private

  def check_has_no_bookmark
    throw :abort unless this.bookmarks.empty?
  end
end
