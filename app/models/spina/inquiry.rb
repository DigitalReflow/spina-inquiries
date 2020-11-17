# frozen_string_literal: true

module Spina
  class Inquiry < ActiveRecord::Base
    include ActionView::Helpers::TextHelper

    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

    validates :name, presence: { message: "Enter name" }
    validates :email, presence: { message: "Enter email" }
    validates :email, format: { with: Inquiry::VALID_EMAIL_REGEX, message: "Enter a valid email" }
    validates :message, presence: { message: "Enter message" }

    scope :newest_first, -> { order(created_at: :desc) }
    scope :marked_as_read, -> { where(read: true) }
    scope :not_marked_as_read, -> { where(read: false) }

    HONEYPOTS = (1..10).map { ('a'..'z').to_a.shuffle[0, 10].join }
  end
end
