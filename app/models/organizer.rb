class Organizer < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, mesasge: "Must be a valid email address!"}
end