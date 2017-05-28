# Preview all emails at http://localhost:3000/rails/mailers/topic_mailer
class TopicMailerPreview < ActionMailer::Preview
  def new_topic_email
    TopicMailer.new_topic_email(Topic.first)
  end
end
