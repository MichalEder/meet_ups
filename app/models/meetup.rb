class Meetup < ApplicationRecord
    belongs_to :organizer, class_name: "User"
    has_many :meetup_registrations, dependent: :destroy
    has_many :participants, through: :meetup_registrations, source: :user
end
