class Jseeker < ApplicationRecord
    has_secure_password
    has_many :applied_fors
    has_many :jobs, through: :applied_fors

    validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "must be valid email" }, uniqueness: {message: "email already used"}
    validates :mobile, presence: true,uniqueness: {message: "mobile number already used"}
end
