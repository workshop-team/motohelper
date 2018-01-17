var Dashboard = {
  setLocation: function() {
    this.positionInfo = document.getElementById("position_info")

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(this.showPosition.bind(this), this.showError.bind(this));
    } else { 
        this.positionInfo.innerHTML = "Geolocation is not supported by this browser.";
    }
  },

  showPosition: function(position) {
    $.ajax({
      type: 'POST',
      url: '/requests/user_position',
      data: { latitude: position.coords.latitude, longitude: position.coords.longitude }
    }).done(function(data){
      $('.closest_service').empty()
      $('.closest_service').append(data.content)
    }.bind(this));
  },

  showError: function(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            this.positionInfo.innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            this.positionInfo.innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            this.positionInfo.innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            this.positionInfo.innerHTML = "An unknown error occurred."
            break;
    }
  }
}
