// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require_tree .

function getLocation(){
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position){
          $.ajax({
            type: 'GET',
            url: '/find_nearby',
            data: { latitude: position.coords.latitude, longitude: position.coords.longitude },
            contentType: 'application/json',
            dataType: 'json'
            }).done(function(data){
               console.log(data)
            });
            if(position) {
              window.location = 'http://localhost:3000/find_nearby?latitude='+ position.coords.latitude+'&longitude='+position.coords.longitude;
            }
        });

    }
  }
