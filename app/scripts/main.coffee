submitEmail    = $('#submit-email')
inputEmail     = $('#input-email')
successMessage = $('#success-message')
errorMessage   = $('#error-message')

submitEmail.click ->

  $.ajax(
    type: 'POST',
    url: "#{apiHost()}/v1/newsletter_subscriptions",
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

# TODO add config file
apiHost = ->
  host = window.location.host
  return '//localhost:3000' if host.match('localhost')
  return '//dinofit-api-staging.herokuapp.com' if host.match('staging')
  '//dinofit-api.herokuapp.com'