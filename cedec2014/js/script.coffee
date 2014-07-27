$(document).ready( ->
  $('#top').load('./top.html')
  $('#screenshots').load('./screenshots.html')
  $('#game-rules').load('./game-rules.html')
  $('#play').load('./play.html')
  $('#contest-rules').load('./contest-rules.html')
  $('#links').load('./links.html')
  
  $(".fancybox").fancybox()

  innerLink = (activeBox) ->
    $('.box').hide()
    $(activeBox).show(1, ->
      window.scrollTo(0, 0)
    )

  $('ul#menu li').click( ->
    activeBox = $(@).find('a').attr('href')
    innerLink(activeBox)
  )
  
  $('a.expand').click( ->
    $('div.expand').slideToggle()
  )
  
  clickLink = ->
    hash = window.location.hash
    if hash isnt ''
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
