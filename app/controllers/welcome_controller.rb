class WelcomeController < ApplicationController
  def index
    if params[:id]
      if params[:nextprev] == "prev"
        data = HTTParty.get("https://api.instagram.com/v1/tags/centropolis/media/recent?client_id=22d190c6050d4b3f8f34af43f98b8161&min_id=#{params[:id]}")
      elsif params[:nextprev] == "next"
        data = HTTParty.get("https://api.instagram.com/v1/tags/centropolis/media/recent?client_id=22d190c6050d4b3f8f34af43f98b8161&max_id=#{params[:id]}")
      end
    else
      data = HTTParty.get("https://api.instagram.com/v1/tags/centropolis/media/recent?client_id=22d190c6050d4b3f8f34af43f98b8161")
    end
    @output = data["data"]
    @pagination = data["pagination"]
    firstdata = HTTParty.get("https://api.instagram.com/v1/tags/centropolis/media/recent?client_id=22d190c6050d4b3f8f34af43f98b8161")
    @firstdata = firstdata["pagination"]
  end
end
