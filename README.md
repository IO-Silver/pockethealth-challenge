# PocketHealth Backend Challenge

## Functionality
This small API is built to store and display DICOM files.

## Installation
### For MacOS
This is the environment that the challenge was written in.  This will require `brew`, which can be installed from (here)[https://brew.sh]

##### Ruby
Install the Ruby environment manager
`brew install rbenv ruby-build`

Download and install Ruby version 3.3.4, then set it to your globally-used version
```
rbenv install 3.3.4
rbenv global 3.3.4
```

Ruby comes with the `gem` method, so we'll use it to install rails and verify once it's done
```
gem install rails
rails --version
```

##### ImageMagick
This is the step that failed for me (my Mac is a little too old) but hopefully it will succeed for you!
`brew install imagemagick`


## Initialization
In order to get the app up and running, call these instructions:
```
bundle install
rails server
```
Now you should be able to submit requests against `localhost:3000`

## API
Using cURL, you can send these requests to the API and receive the corresponding responses
### POST: Create a new PatientRecord
This will create the db entry for the file, and return its id to you.
##### Request
`curl -F dicom=@path/to/local/dicom/file localhost:3000/patient_records`

##### Response
`ba3c7364-399b-43ed-8e7b-ad33fb81e98f`

### GET: Request a Record's Attribute Tag
With a record's id, you can request attributes by passing in the `tag` query parameter
##### Request
`curl localhost:3000/patient_records/ba3c7364-399b-43ed-8e7b-ad33fb81e98f/headers?tag=0010,0010`

##### Response
`NAYYAR^HARSH`

### GET: Request a Record's image
#### WARNING: Unfortunately, I could not test this part of my solution, as my laptop is incompatible with newer ImageMagick builds (upon which the dicom gem relies)
##### Request
`curl localhost:3000/patient_records/ba3c7364-399b-43ed-8e7b-ad33fb81e98f/image`

##### Response
`The image data in png format`


## Developer Notes
I opted to use Ruby on Rails to complete this coding challenge.  Rails generates a much larger project than GO would have, but I'm a little more familiar with its ins and outs.  Ruby's DICOM Gem relying on ImageMagick is another faux pas I would have liked to avoid, but alas, I had almost completed the project when I discovered this dependency :(