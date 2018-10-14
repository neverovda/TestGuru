document.addEventListener('turbolinks:load', function() {
  var form = document.querySelector('.registration')
  if (form) { passwordConfirmation() }
})

function passwordConfirmation() {

  passField = document.getElementById('user_password')
  passConfirmField = document.getElementById('user_password_confirmation')
  alertDirrerence = document.querySelector('.password-dirrerence')


  passField.addEventListener('keyup', checkDifference)
  passConfirmField.addEventListener('keyup', checkDifference)

  function checkDifference() {
    
    passConfirmation = passConfirmField.value
    password = passField.value

    if (passConfirmation == '' ||  password == passConfirmation) { 
      hideAlert() 
      return
      }
    showAlert() 
  }

  function hideAlert() {
    alertDirrerence.classList.add('hide')
  }

  function showAlert() {
    alertDirrerence.classList.remove('hide')
  }

}
  
