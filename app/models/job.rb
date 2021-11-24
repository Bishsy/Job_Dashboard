class Job < ApplicationRecord
  belongs_to :user
  has_many :applied_fors, dependent: :destroy
  has_many :jseekers, through: :applied_fors
end
