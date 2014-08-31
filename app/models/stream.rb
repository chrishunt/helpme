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

  def notify_subscriptions
    self.update_attribute :broadcasted, true
    subscriptions.each do |s|
      SubscriptionMailer.notify(s, self).deliver
    end
  end

  private

  def subscriptions
    Subscription.all.map do |s|
      s unless (
        s.subjects.split.map(&:downcase) &
        comments.split.map(&:downcase)
      ).empty?
    end.compact
  end

  def create_slug
    self.slug = Base64.encode64(UUIDTools::UUID.random_create)[0..8]
  end

  def create_opentok_session
    self.opentok_id = OPENTOK.create_session.session_id
  end
end
