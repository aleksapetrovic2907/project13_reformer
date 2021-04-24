class User < ApplicationRecord
    validate :username, presence: true
    validate :email, presence: true
    validate :password, presence: true
end
