class MainPage extends Page
  
  constructor: ->
    @parts = {}
    @parts.titleLogo = new TitleLogo(this)
    @parts.menu = new Menu(this)
  
  update: ->
    y = @parts.titleLogo.update()
    @parts.menu.update(y)
    return

  draw: (ctx) ->
    @parts.titleLogo.draw(ctx)
    @parts.menu.draw(ctx)
    return

  touchStartEvent: (e)->
    @parts.titleLogo.touchEvent(e)
    return

  touchMoveEvent: (e)->
    @parts.menu.touchMoveEvent(e)
    return

class Menu extends Parts
  
  constructor: ->
    @parts = {}
    @parts.info = new MenuParts('Info',120,120)
    @parts.work = new MenuParts('Works',120,240)
    @parts.aboutMe = new MenuParts('About Me',120,360)
    @parts.contact = new MenuParts('Contact',120,480)

  update: (y) ->
    for menuParts of @parts
      @parts[menuParts].update(y)

  draw: (ctx) ->
    for menuParts of @parts
      @parts[menuParts].draw(ctx)

  touchMoveEvent: (e) ->
    for menuParts of @parts
      @parts[menuParts].touchMoveEvent(e)

class MenuParts extends Parts
  
  constructor: (@text,@x,@y) ->
    @size = 48
    @visible = false

  update: (y)->
    if @y + 64 < y and @visible is false
      @visible = true
      @cursor = true
      @cursor = 0
    if !(@y + 64 < y) and @visible is true
      @visible = false

    if @visible and @cursor < @text.length
      ++@cursor

  draw: (ctx) ->
    if @visible
      text = @text.substr(0,@cursor)
      ctx.lineWidth = 2
      ctx.font = @size + "px 'Crimson Text', serif"
     
      if @active then ctx.fillStyle = 'rgb(176,255,176)' else ctx.fillStyle = 'rgb(0,160,233)'
      ctx.fillText(text,@x,@y)

      if @active then ctx.strokeStyle = 'rgb(112,205,14)' else ctx.strokeStyle = 'rgb(1,64,153)'
      ctx.strokeText(text,@x,@y)

  touchMoveEvent: (e) ->
    if @x <= e.x < @x + ctx.measureText(@text).width and @y - @size <= e.y < @y + @size/4
      @active = true
    else
      @active = false

class TitleLogo extends Parts

  constructor: ->
    @text = 'W125. Works'
    @sY = 88
    @eY = 640
    @x = 32
    @size = 64
    @y = @sY
    @dy = 0
    @ay = 0
    @cursor = 0

  update: ->
    @dy += @ay
    @y += @dy
    if @y > @eY
      @y = @eY
      @dy = 0
      @ay = 0

    if @y <= @sY
      @y = @sY
      @dy = 0
      @ay = 0

    ++@cursor if @cursor < @text.length
    return @y

  draw: (ctx)->
    text = @text.substr(0,@cursor)
    ctx.lineWidth = 2
    ctx.font = @size+"px 'Crimson Text', serif"
    
    ctx.fillStyle = 'rgb(0,160,233)'
    ctx.fillText(text,@x,@y)

    ctx.strokeStyle = 'rgb(1,64,153)'
    ctx.strokeText(text,@x,@y)

  touchEvent:(e)->

    ctx.font = @size+"px 'Crimson Text', serif"
    if @y is @eY and @x <= e.x < @x + ctx.measureText(@text).width and @y - @size <= e.y < @y + @size/4
      @dy = -48
      @ay = 2

    if @y isnt @eY
      @ay = 2

