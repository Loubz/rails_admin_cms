CMS.flash_messages = ->
  $('[data-cms-flash]').fadeIn().delay(3500).fadeOut(800);

CMS.ready ->
  CMS.flash_messages()