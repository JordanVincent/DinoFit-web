(function(){var a,b,c,d,e,f;e=$("#submit-email"),d=$("#input-email"),f=$("#success-message"),b=$("#error-message"),e.click(function(){return $.ajax({type:"POST",url:""+a()+"/v1/newsletter_subscriptions",data:{newsletter_subscription:{email:d.val()}},crossDomain:!0}).done(function(){return f.fadeIn()}).fail(function(a){return b.find("small").text(c(a)),b.fadeIn()}).always(function(){return d.val(""),setTimeout(function(){return f.fadeOut(),b.fadeOut()},2e3)})}),c=function(a){var b;return b=$.parseJSON(a.responseText),b.errors||b.errors.email?"Email "+b.errors.email.join(", "):b.error?b.error:"Unknown error"},a=function(){var a;return a=window.location.host,a.match("localhost")?"//localhost:3000":a.match("staging")?"//dinofit-api-staging.herokuapp.com":"//dinofit-api.herokuapp.com"}}).call(this);