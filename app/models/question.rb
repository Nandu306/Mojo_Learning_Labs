class Question < ApplicationRecord
  belongs_to: assignment

  validates :prompt, presence: true
  validates :answer, presence: true

end
