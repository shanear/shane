class GameObject
  constructor: (@game, @x, @y) ->

  load: (onLoad) ->
    @image = new Image()
    @image.onload = onLoad
    @image.src = image_path("bicyclist.png")

  init: ->
    @width = @image.width
    @height = @image.height

  draw: ->
    @y = (@game.canvas.height - @height - 50)
    @game.context.drawImage(@image, @game.screenX(@x), @y, @width, @height)

  centerX: ->
    @x + (@width / 2)

class Game
  @canvas: null,
  @context: null,

  constructor: (@canvas, width, height) ->
    @resize(width, height)
    @context = @canvas.getContext("2d")
    @assetsLoaded = 0
    @totalAssets = 2
    @cameraX = 0

    @bicyclist = new GameObject(this, 200, 0)

    @houses = {
      1: [],
      2: []
    }

  resize: (width, height) ->
    @screenWidth = @canvas.width = width
    @screenHeight = @canvas.height = height

    @setCamera(@cameraX)
    @draw() if @isLoaded()

  onAssetLoad: ->
    @assetsLoaded += 1
    @init() if @isLoaded()

  load: ->
    @bicyclist.load( => @onAssetLoad() )

    @image = new Image()
    @image.onload = => @onAssetLoad()
    @image.src = image_path("victorian1.png")
    @houseX = 200

  draw: ->
    @context.clearRect(0, 0, @screenWidth, @screenHeight)

    # Draw the grass
    @context.fillStyle = "#072"
    @context.fillRect(0, @canvas.height - 250, @canvas.width, @canvas.height - 150)

    @context.fillStyle = "#999"
    @context.fillRect(0, @canvas.height - 200, @canvas.width, @canvas.height - 150)

    # Draw the house
    @context.drawImage(@image, @screenX(@houseX - @image.width + 3), @canvas.height - 195  - @image.height)

    # Draw the road
    @context.fillStyle = "#333"
    @context.fillRect(0, @canvas.height - 150, @canvas.width, @canvas.height - 150)

    @bicyclist.draw()

  init: ->
    @bicyclist.init()
    game.centerCamera(@bicyclist)

    @draw()

  centerCamera: (gameObject) ->
    @setCamera(gameObject.centerX() - (@screenWidth/2))

  setCamera: (x) ->
    if x < 0
      @cameraX = 0
    else
      @cameraX = x

    @draw() if @isLoaded()

  screenX: (x) ->
    x - @cameraX

  isLoaded: ->
    @assetsLoaded >= @totalAssets

game = null

$(document).ready ->
  canvas = document.getElementById("game")
  game = new Game(canvas, window.innerWidth, window.innerHeight)

  game.load()

  $(window).resize ->
    game.resize(window.innerWidth, window.innerHeight)

  $(window).scroll ->
    #game.setCamera(0 + $(window).scrollTop())

