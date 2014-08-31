class SubscriptionMailer < ActionMailer::Base
  default from: 'noreply@helpme.webcam'

  def notify(subscription, stream)
    @subscription = subscription
    @stream = stream
    @url = "http://helpme.webcam/streams/#{@stream.slug}"

    mail(to: @subscription.email, subject: 'Someone needs your help!')
  end
end
