class Job < ApplicationRecord
  belongs_to :user
  has_many :applied_fors
  has_many :jseekers, through: :applied_fors
end
