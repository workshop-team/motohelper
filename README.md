# README

### Download and setup the app

We are using RVM (https://rvm.io/)

if you use SSH  
``` git clone git@github.com:workshop-team/motohelper.git ```  
if you use HTTPS  
``` git clone https://github.com/workshop-team/motohelper.git ```  

```
cd motohelper
  
Change name of file '.env_sample' to '.env' and make your own settings.  
  
gem install bundler
brew install imagemagick (on OSX) or sudo apt-get install ruby-mini-magick (on Ubuntu)
bundle
rake db:setup
rake motohelper:load_sample_data

rails s
```
* Important: *
Config mailer on production:
``` config/environments/production.rb ```
``` config.action_mailer.default_url_options = { host: 'example.com' } ```
:host should be set to the actual host of application.
