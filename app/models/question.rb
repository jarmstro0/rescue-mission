class Question < ApplicationRecord
  has_many :answers
  
  validates :title, length: { minimum: 20 }, presence: true
  validates :description, length: { minimum: 50 }, presence: true
end
