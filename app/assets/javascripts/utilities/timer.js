document.addEventListener('turbolinks:load', function() {
  
  var timer = document.querySelector('.timer');

  if (timer) {
    
    var minutes = document.querySelector('.minutes');
    var seconds = document.querySelector('.seconds');
    var redirectPath = timer.dataset.redirect;
    var timeSeconds = timer.dataset.time;
    
    setInterval(function() {

      timeSeconds -= 1;   

      if (timeSeconds < 0 ) 
        { alert('Time out');
          window.location.replace(redirectPath) } 

      minutes.textContent = Math.floor(timeSeconds / 60);
      seconds.textContent = timeSeconds % 60;

      }, 
    1000);
   }  
})
