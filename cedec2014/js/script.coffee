$(document).ready( ->
  $('#top').load('./top.html')
  $('#screenshots').load('./screenshots.html', ->
    $(".fancybox").fancybox()
  )
  $('#game-rules').load('./game-rules.html')
  $('#play').load('./play.html')
  $('#contest-rules').load('./contest-rules.html', ->
    $('a.expand').click( ->
      $('div.expand').slideToggle()
    )
  )
  $('#links').load('./links.html')

  innerLink = (activeBox) ->
    $('.box').hide()
    $(activeBox).fadeIn()
  
  clickLink = ->
    hash = window.location.hash
    if hash isnt '' and $(hash).length > 0
      innerLink(hash)

  $(window).bind('hashchange', ->
    clickLink()
  )

  if window.location.hash is ''
    $('#top').fadeIn('slow')
    $('ul#menu').hide(0, ->
      $('ul#menu').fadeIn('slow')
    )
  else
    clickLink()
)
