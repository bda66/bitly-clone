class Link < ApplicationRecord
  scope :user_links, ->(user_uuid) { where(created_by: user_uuid) }

  validates :original_url, :short_url, :created_by, :clicks_count, presence: true
  validates :short_url, uniqueness: true

  def add_click
    update(clicks_count: clicks_count + 1)
  end
end
