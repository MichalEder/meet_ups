class User < ApplicationRecord
    has_secure_password
    has_many :meetup_registrations
    has_many :registered_meetups, through: :meetup_registrations, source: :meetup

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, mesasge: "Must be a valid email address!"}
end
