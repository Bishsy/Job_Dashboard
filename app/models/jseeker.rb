class Jseeker < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "must be valid email" }, uniqueness: {message: "email already used"}
    validates :mobile, presence: true,uniqueness: {message: "mobile number already used"}
end
