class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: '¡Bienvenido a CreaTuLiga.com!')
  end

  def topic_create_email(topic)
    @topic = topic
    @user = @topic.user
    @foro = Foro.find(@topic.id)
    @owner = @foro.user
end
