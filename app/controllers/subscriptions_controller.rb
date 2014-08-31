class SubscriptionsController < ApplicationController
  def index
    redirect_to new_subscription_path
  end

  def new
    @subscription = Subscription.new
  end

  def create
    email = params['subscription']['email']
    subjects = params['subscription']['subjects']

    subscription = Subscription.find_or_create_by(email: email)
    subscription.subjects = subjects

    redirect_to subscription.init!
  end

  def show
    @subscription = Subscription.find_by(slug: params['id'])
  end
end
