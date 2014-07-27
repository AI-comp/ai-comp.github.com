$(document).ready( ->
  $('#top').fadeIn()
  $('ul#menu').fadeIn()

  $('#about').load('./about.html')
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
    $('#description p').hide()
    $('#description h1').show()
    activeBox = $(@).find('a').attr('href')
    innerLink(activeBox)
  )
  $('#description h1').click( ->
    $('#description p').fadeIn()
    $('#description h1').hide()
    activeBox = $(@).find('a').attr('href')
    innerLink(activeBox)
  )
  
  $('a.expand').click( ->
    $('div.expand').slideToggle()
  )
  
  clickLink = ->
    $('#menu-' + window.location.hash.substring(1)).click()

  $(window).bind('hashchange', ->
    clickLink()
  )
  clickLink()
)
