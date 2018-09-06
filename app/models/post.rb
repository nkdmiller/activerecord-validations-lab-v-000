class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity?

  KEYWORDS = [
    "Won't Believe", "Secret", "Top", "Guess"
  ]
  def clickbaity?
      if title && KEYWORDS.none? {|headline| title.include?(headline)}
        errors.add(:title, "not alluring enough")
      end
  end
end
