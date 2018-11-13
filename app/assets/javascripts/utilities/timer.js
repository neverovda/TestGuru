document.addEventListener('turbolinks:load', function() {
  
  var timer = document.querySelector('.timer');

  if (timer) {
    
    var minutes = document.querySelector('.minutes');
    var seconds = document.querySelector('.seconds');
    var timeSeconds = timer.dataset.time;
    
    setInterval(function() {

      if (timeSeconds == 0 ) { 
        var button = document.querySelector('.next');
        button.click()
      } else {
        minutes.textContent = Math.floor(timeSeconds / 60);
        seconds.textContent = timeSeconds % 60;
      }  

      timeSeconds -= 1;

      }, 
    1000);
   }  
})
