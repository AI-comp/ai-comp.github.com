class Terraforming extends Page

  constructor: ->
    @parts = {}
    @parts.hex = new Hex(this)

  update: ->
    return

  draw: ->
    return

  touchStartEvent: (e) ->
    return

  touchMoveEvent: (e) ->
    return

class Random
  int:(n) ->
    Math.floor(Math.random() * n)

class Tile
  constructor:(@x,@y) ->
    @owner = -1
    @robots = 0
    @movedrobots = 0
    @additionalScore = 0
    @installation = 'None'
    @isHole = false

class Field
  @field = {}
  @radius = 7

  generate: ->
    rand = new Random()
    for y in [0...@radius]
      for x in [-y + 1 ... -y + @radius]
         if rand.int(5) is 0
           @field["#{x},#{y}"].isHole = true
         else
           @field["#{x},#{y}"].isHole = true


class Hex extends Parts
  
  constructor: ->

  draw: (ctx)->

