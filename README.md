# README

### Download and setup the app

if you use SSH  
``` git clone git@github.com:workshop-team/motohelper.git ```  
if you use HTTPS  
``` git clone https://github.com/workshop-team/motohelper.git ```  

```
cd motohelper/
gem install bundler
bundle
rake db:setup
rake db:migrate
rake db:seed
rails s
```
* Important: *
Config mailer on production:
``` config/environments/production.rb ```
``` config.action_mailer.default_url_options = { host: 'example.com' } ```
:host should be set to the actual host of application.
