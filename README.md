# S3DirectUploadDemo

Demo application for the gem [s3_direct_upload](https://github.com/waynehoover/s3_direct_upload).

**Works under IE6+ !**

## Getting Started

Edit `config/initializers/s3_direct_upload.rb` with your S3 credentials.

	S3DirectUpload.config do |c|
	  c.access_key_id 		= "your_access_key"
	  c.secret_access_key 	= "your_secret_key"
	  c.bucket 				= "your_bucket_name"
	  c.region 				= "your_region"
	end
	
Run:

	bundle
	bundle exec rake db:migrate
	
Then start the server:

	rails s
	
Go to [http://localhost:3000](http://localhost:3000) and try to upload a new image. If everything went well, you should see the image on the page automatically. You can watch network requests using the deverlopper tools of your browser.

## Known Issues

I had to edit [s3_direct_upload](https://github.com/waynehoover/s3_direct_upload) gem because my S3 link was something like:

	http://my_bucket_name.s3.amazonaws.com
	
The gem try to hit:

	http://my_region.amazonaws.com/my_bucket_name
	
Here is the gem code before:

	def url
      "http#{@options[:ssl] ? 's' : ''}://#{@options[:region]}.amazonaws.com/#{@options[:bucket]}/"
    end
    
Here is the gem code after:

	def url
      "http#{@options[:ssl] ? 's' : ''}://#{@options[:bucket]}.s3.amazonaws.com/"
    end    
    
I don't know very much about S3, so this might not be an issue at all for you.