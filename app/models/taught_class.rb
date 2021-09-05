class TaughtClass < ApplicationRecord
  belongs_to :teacher, -> { where(role: "teacher") }, class_name: "User"
end
