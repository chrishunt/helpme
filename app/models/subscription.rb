require 'uuidtools'
require 'base64'

class Subscription < ActiveRecord::Base
  def init!
    create_slug
    save!
    self
  end

  def to_param
    slug
  end

  private

  def create_slug
    self.slug = Base64.encode64(UUIDTools::UUID.random_create)[0..8]
  end
end
