
submitEmail  = $('#submit-email')
inputEmail   = $('#input-email')
messageEmail = $('#message-email')

messageEmail.hide()

submitEmail.click ->
  console.log inputEmail.val()
  inputEmail.val('')
  messageEmail.fadeIn()
  setTimeout( ->
    messageEmail.fadeOut()
  , 2000)
