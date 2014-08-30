require 'uuidtools'
require 'base64'

class Stream < ActiveRecord::Base
  def init!
    create_slug
    create_opentok_session
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

  def create_opentok_session
    self.opentok_id = OPENTOK.create_session.session_id
  end
end
