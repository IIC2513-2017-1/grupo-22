module ApplicationHelper

	def youtube_video(url)
    render 'videos/video', url: url 
	end 

end
