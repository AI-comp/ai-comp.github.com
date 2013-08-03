class Event
  @x
  @y
  @length
  multX : []
  multY : []
  constructor: (@length,@multX,@multY)->
    @x = @multX[0]
    @y = @multY[0]
    return

class Page
  parts : {}
  _jumpScene : null
  gameUpdate: ->
    return

  constructor: (@Game) ->

  init: () ->
    @_jumpScene = null
    return

  draw: (ctx)->
    return

  touchStartEvent: (e) ->
    return

  touchMoveEvent: (e) ->
    return

  touchEndEvent: () ->
    return

class Parts
  constructor: (@Scene) ->

  draw: (ctx)->
    ctx.globalAlpha = 1.0
    ctx.shadowBlur = 0
    ctx.shadowColor = 'rgba(0,0,0,0)'
    ctx.textAlign = 'start'
    return

class Button extends Parts
  press: (e) ->
    @active = (@x <= e.x < @x + @w and @y <= e.y < @y + @h)

class Engine

  init : (@page,currentPage) =>
    @WIDTH = 960
    @HEIGHT = 720
    @WAIT = 30
    
    @images = {}
    @imageLoadCount = 0

    Engine::currentPage = currentPage
    @canvas = document.createElement('canvas')
    objBody = document.getElementsByTagName("body").item(0)
    objBody.appendChild(@canvas)
    @ctx = @canvas.getContext('2d')
    @canvas.id = 'MainCanvas'
    @canvas.width = @WIDTH
    @canvas.height = @HEIGHT
    @canvas.style.cssText = 'position:absolute;top: 0px;left: 0px;z-index: 1;'
    @canvas.addEventListener('mousedown', Engine::mouseDownListener, false)
    @canvas.addEventListener('mousemove', Engine::mouseMoveListener, false)
    @canvas.addEventListener('mouseup', Engine::mouseUpListener, false)

  run : ()->
    load()
    @loadLoopTimer = setInterval(loadLoop, @WAIT)
    @mainLoopTimer = setInterval(mainLoop, @WAIT)

  ###
  #load
  ###
 
  load = ->
    @isLoad = true

  loadLoop = ->
    if @isLoad
      clearInterval(@loadLoopTimer)

  loadImage: (fileName) ->
    @images[fileName] = new Image()
    @images[fileName].onload = =>
      ++@imageLoadCount
    @image[fileName].src = fileName
    return @image[fileName]

  ###
  #main loop
  ###

  mainLoop = ->
    if !@isLoad
      openingDraw()
      return
    update()
    draw()
    return

  update = ->
    ++@frameCount
    @currentPage.update()

  openingDraw = ->
    return

  draw = ->
    @ctx.clearRect(0,0,@WIDTH,@HEIGHT)
    @currentPage.draw(@ctx)
    return

  ###
  # controller
  ###

  mouseDownListener : (e) =>
    multX = [e.pageX]
    multY = [e.pageY]
    event = new Event(1, multX, multY)
    Engine::currentPage.touchStartEvent(event)
    e.preventDefault()
    return

  mouseMoveListener : (e) =>
    multX = [e.pageX]
    multY = [e.pageY]
    event = new Event(1, multX, multY)
    Engine::currentPage.touchMoveEvent(event)
    e.preventDefault()
    return

  mouseUpListener : (e) =>
    Engine::currentPage.touchEndEvent()
    e.preventDefault()
    return

