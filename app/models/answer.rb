class Answer < ApplicationRecord
  belongs_to :question

  validates :answer, length: { minimum: 50 }, presence: true
end
