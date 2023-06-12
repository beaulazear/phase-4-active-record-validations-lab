class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbaity

    def is_clickbaity
        # titles = ["won't believe", "guess", "secret", "top #{integer}"]

        x = /won't believe|guess|secret|top [0-9]/
        if title
            unless x.match?(title.downcase)
                errors.add(:title, "Please only use captivating titles that include keywords such as Guess, Secret, Won't Believe, or top (some number)")
            end
        end
    end
end
