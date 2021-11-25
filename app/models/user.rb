class User < ApplicationRecord
    has_many :jobs
    has_secure_password

    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be valid email" }
    validates :mobileno, presence:true,uniqueness: {message: "mobile number already used"},:numericality => true, :length => { :minimum => 10, :maximum => 10 }
    validates :cinumber ,presence: true
    validates :cname,presence: true
end
