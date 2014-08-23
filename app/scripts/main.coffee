# API_HOST = '//localhost:3000'
API_HOST = '//candyfit-api.herokuapp.com' # TODO add config file

submitEmail    = $('#submit-email')
inputEmail     = $('#input-email')
successMessage = $('#success-message')
errorMessage   = $('#error-message')

submitEmail.click ->

  $.ajax(
    type: 'POST',
    url: "#{API_HOST}/v1/newsletter_subscriptions",
    data: { newsletter_subscription: { email: inputEmail.val() } },
    crossDomain: true

  ).done( ->
    successMessage.fadeIn()

  ).fail( (response) ->
    errorMessage.find('small').text formatError(response)
    errorMessage.fadeIn()

  ).always( ->
    inputEmail.val('')
    setTimeout( ->
      successMessage.fadeOut()
      errorMessage.fadeOut()
    , 2000)
  )

  formatError = (response) ->
    error = $.parseJSON(response.responseText)

    unless error.errors or error.errors.email
      return if error.error then error.error else 'Unknown error'
    'Email ' + error.errors.email.join(', ')

