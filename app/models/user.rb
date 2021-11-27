class User < ApplicationRecord
    has_many :jobs, dependent: :destroy
    has_secure_password

    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be valid email" }
    validates :mobileno, presence:true,uniqueness: {message: "mobile number already used"}
    validates :cinumber ,presence: true
    validates :cname,presence: true
end
