class Main extends Engine

  window.onload = -> init()

  init = ->
    @page = {}
    @page.main = new Terraforming()
    @currentPage = page.main
    super(@page,@currentPage)
    run()

  run = ->
    super()

