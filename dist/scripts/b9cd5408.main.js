(function(){var a,b,c,d,e;a="//candyfit-api.herokuapp.com",d=$("#submit-email"),c=$("#input-email"),e=$("#success-message"),b=$("#error-message"),d.click(function(){var d;return $.ajax({type:"POST",url:""+a+"/v1/newsletter_subscriptions",data:{newsletter_subscription:{email:c.val()}},crossDomain:!0}).done(function(){return e.fadeIn()}).fail(function(a){return b.find("small").text(d(a)),b.fadeIn()}).always(function(){return c.val(""),setTimeout(function(){return e.fadeOut(),b.fadeOut()},2e3)}),d=function(a){var b;return b=$.parseJSON(a.responseText),b.errors||b.errors.email?"Email "+b.errors.email.join(", "):b.error?b.error:"Unknown error"}})}).call(this);