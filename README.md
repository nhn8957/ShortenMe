# ShortenMe

## Holistics interview assignment 
#### Applicant: Nhiem Ngo

### Deployed app on Heroku
[http://desolate-atoll-73195.herokuapp.com/]

### Users can:

*input a URL and get it shortened.
*be redirected to the correct URL when enter the shortened URL’s link
*have analytics with basic numbers at http://desolate-atoll-73195.herokuapp.com//[code]/stat

### My progress:

My background: some experiences working with Ruby on Rails

#####Back-end

**Framework:** I decided to use Ruby on Rails as the main framework of this project since I have most experience with it.

**Shortening mechanism:** After researching, I decided to implement the shortening mechanism as follow:

The app would take the URL from the user, save it in the database, and use the id, which is always unique, to generate a parameter called :output_url which I will use to identify the original url from the database.

Here is the shorten() method in my controller:

```erb
def shorten(i, a)
	s = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  	a = a + s[i%62];
  	if i < 62 then
      		return a.reverse
  	else
  	    	shorten(i/62, a)
  	end
end	
```

The method will take a base-10 integer and convert it into a unique string.

*Retrieval:* 

```erb
def redirect
		if @url = Url.find_by(output_url: params[:request])
			@url = Url.find_by(output_url: params[:request])
			impressionist(@url) #count redirection here
			redirect_to @url.original_url
		else
			redirect_to root_path, alert: "Sorry, your request is not valid"
		end	
	end
```

When a user submit a request, the redirect method will search in the database for an output_url that matches the user's request. If there is none, the user will be redirected to the home page.

*Hit count:* I use the [Impressionist](https://github.com/charlotte-ruby/impressionist) gem to count each time the redirect method is used. The hit count is displayed at /[code]/stat
Unfortunately, I left out data visualization. 

#####Front-end:
I use Bootstrap and basic html/css for my app.

##### Challenges:
* With this app, the biggest challenge I faced was the third requirement: data visualization. I have little experience working with it, and was not able to implement all the functionalities in time.

* Sqlite3: Just as I was pushing the app to Heroku, I realized I was not using Postgresql. I ended up having to ask for 1 additional hour. 

##Thank you!
 
