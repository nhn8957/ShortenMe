class UrlsController < ApplicationController
	def new

	end

	def create
		if @url = Url.find_by(url_params)
			@url = Url.find_by(url_params)
			redirect_to @url
		else
			@url = Url.new(url_params)
			if @url.save
				@url.output_url = shorten(@url.id, '')
				@url.save
				redirect_to @url
			else
				raise 'afsasf' 
				redirect_to root_path #invalid url
			end	
		end
	end

	def show
		@url = Url.find(params[:id])
	end

	def redirect
		if @url = Url.find_by(output_url: params[:request])
			@url = Url.find_by(output_url: params[:request])
			impressionist(@url) #count redirection here
			redirect_to @url.original_url
		else
			redirect_to root_path #404 page
		end	
	end

	def stat
		if @url = Url.find_by(output_url: params[:request])
			@url = Url.find_by(output_url: params[:request])
		else
			redirect_to root_path #404 page
		end
	end

private

	def url_params
		params.require(:url).permit(:original_url)

	end

	def shorten(i, a)	
		s = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  		a = a + s[i%62];
  		if i < 62 then
  	    	return a.reverse
  		else
  	    	shorten(i/62, a)
  		end
	end

end
