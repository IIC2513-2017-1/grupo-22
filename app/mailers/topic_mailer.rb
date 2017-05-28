class TopicMailer < ApplicationMailer
  def new_topic_email(topic)
    @topic = topic
    @user = topic.user
    @tourney = Foro.find(@topic.foro_id).tourney
    @owner = @tourney.user
    @url = topics_url(@topic)
    if @owner.username != @user.username
      mail(to: @owner.email, subject: 'Nuevo topic en torneo #{tourney.name}')
    end
  end
end
