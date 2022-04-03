require 'digest/md5'

class Link < ApplicationRecord
  belongs_to :user

  validates :original_url, presence: true
  validates :slug, uniqueness: true

  before_validation :generate_slug

  def generate_slug
    self.slug = Digest::MD5.hexdigest(original_url)[0..5] if slug.nil? || slug.empty?
    true
  end

  def self.shorten(user, url, slug = '')
    return unless user

    link = Link.where(original_url: url, slug: slug).first
    return link.short if link

    link = Link.new(user: user, original_url: url, slug: slug)
    return link.short if link.save

    Link.shorten(url, slug + SecureRandom.uuid[0..2])
  end

  def short
    Rails.application.routes.url_helpers.short_url(slug: slug)
  end

  private

  def link_params
    params.permit(:slug)
  end
end
