class Book < ApplicationRecord
    has_one_attached :cover_image
    validates :title, presence: true
    validates :author, presence: true
    validates :read_status, presence:true
    validates :rating, inclusion: { in: 0..5 }, allow_nil: true
    validates :read_status, inclusion: { in: %w[to_read reading completed] }
end
