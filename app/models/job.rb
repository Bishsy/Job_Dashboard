class Job < ApplicationRecord
  belongs_to :user
  has_many :applied_fors, dependent: :destroy
  has_many :jseekers, through: :applied_fors
  validates :job_title, presence: true
  validates :job_des, presence: true, length: { minimum: 10 }
  validates :job_percat, presence: true
end
