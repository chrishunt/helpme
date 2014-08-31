class SubscriptionMailer < ActionMailer::Base
  default from: 'noreply@example.com'

  def notify(subscription, stream)
    @subscription = subscription
    @stream = stream
    @url = "http://localhost:3000/streams/#{@stream.slug}"

    mail(to: @subscription.email, subject: 'Someone needs your help!')
  end
end
