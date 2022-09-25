class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
  validate :title_words

  VALID_WORDS = ["Won't Believe", "Secret", "Top", "Guess"]

  def title_words
    if title != nil
      if VALID_WORDS.any? { |w| title.include?(w) }
        nil
      else
        errors.add(:title, "Please try again")
      end
    end
  end
end
