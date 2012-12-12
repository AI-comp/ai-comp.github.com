userNames = ["iskwkn","uwi","sy","R.Kuzumi","b_head","niwa","hasi","yhrin","bells","henteko","jag"]
playerNames = ["todo takatora","Wall Cult","test","kuzumi","B_head:ColonizeAI","TEST_A","hasi","yhrin","yai","henteko","SettlerX"]

writePage = (result) ->
  formText = "<input type='radio' name='team' value='all' checked>all\n"
  for name in userNames
    formText += "<input type='radio' name='team' value=#{name}>#{name}\n"
  text = """
  <h2>Game</h2>
    <p><form>Player #{formText}</form></p>
    <table class='result'>
      <tr class='header'>
        <th>Game</th>
        <th>Rank</th>
        <th>Name</th>
        <th>AI Name</th>
        <th>Score</th>
        <th>Replay</th>
      </tr>"""

  gameId = 0
  for index of result
    ++gameId
    game = result[index]
    rank = [game.ranks.indexOf(1),game.ranks.indexOf(2),game.ranks.indexOf(3)]
    rankName = ['1st','2nd','3rd']
    player = []
    replay = game.file
    replayLink = "<a href='applet/#{replay.substring(replay.indexOf('/') + 1, replay.indexOf('.'))}.html'>replay</a>"
    for i in [0 ... 3]
      player[i] = {}
      player[i].name = userNames[playerNames.indexOf(game.names[rank[i]])]
      player[i].aiName = game.names[rank[i]]
      player[i].score = game.scores[rank[i]]

    text += """
    <tr>
      <td rowspan="3">##{gameId}</td>
      <td class='top'>1st</td>
      <td class='top_name'>#{player[0].name}</td>
      <td class='top_name'>#{player[0].aiName}</td>
      <td class='top'>#{player[0].score}</td>
      <td rowspan="3">#{replayLink}</td>
    </tr>
    <tr>
      <td>2nd</td>
      <td class='name'>#{player[1].name}</td>
      <td class='name'>#{player[1].aiName}</td>
      <td>#{player[1].score}</td>
    </tr>
    <tr>
      <td>3rd</td>
      <td class='name'>#{player[2].name}</td>
      <td class='name'>#{player[2].aiName}</td>
      <td>#{player[2].score}</td>
    </tr>
    """
  text += "</table>"
  document.getElementById('game').innerHTML = text

httpRequest = new XMLHttpRequest()
httpRequest.open('GET', 'applet/replay/result.json', true)
httpRequest.addEventListener("load",((event) =>
    if httpRequest.readyState is 4
      result = JSON.parse(httpRequest.responseText)
      httpRequest = null
      writePage(result))
)
httpRequest.send(null)


