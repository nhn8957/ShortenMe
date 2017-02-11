# ShortenMe

## Holistics interview assignment 
#### Applicant: Nhiem Ngo

### Deployed app on Heroku:

http://desolate-atoll-73195.herokuapp.com/

### Users can:

* Submit an URL and get it shortened.
* Be redirected to the correct URL when enter the shortened URL’s link
* Access analytics with basic numbers at http://desolate-atoll-73195.herokuapp.com//[code]/stat

### My progress:

**My background:** experiences working with Ruby on Rails. 

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

**Retrieval:** 

```erb
def redirecte	
if @url = Url.find_by(output_url: params[:request])
		@url = Url.find_by(output_url: params[:request])
		impressionist(@url) #count redirection here
		redirect_to @url.original_url
	else
		redirect_to root_path, alert: "Sorry, your request is not valid"
	nd	
end
```

When a user submit a request, the redirect method will search in the database for an :output_url that matches the user's request. If there is none, the user will be redirected to the home page.

**Hit count:** I use the [Impressionist](https://github.com/charlotte-ruby/impressionist) gem to count every time the redirect method is used. The hit count is displayed at /[code]/stat

Unfortunately, I left out data visualization due to time constraint. 

**Front-end:**
I use Bootstrap and basic HTML/CSS for my app.

**Challenges:**
* With this app, the biggest technical challenge I faced was the third requirement: data visualization. I have little experience working with it, and was not able to implement all the functionalities in time.

* **SQLite and heroku**: Just as I was pushing the app to Heroku, I realized I was not using Postgresql and could not finish. I ended up having to call Mr Huy and ask for 1 hour more. 

* Working on this was really difficult. However, I learned a lot during the process, and I hope to have the chance to continue at your company.

##Thank you!
 
