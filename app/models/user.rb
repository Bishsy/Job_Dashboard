class User < ApplicationRecord
    has_many :jobs
    has_secure_password

    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be valid email" }
    validates :mobileno, presence:true
end
