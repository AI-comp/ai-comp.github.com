userNames = ["iskwkn","uwi","sy","R.Kuzumi","b_head","niwa","hasi","yhrin","bells","henteko","jag"]
playerNames = ["todo takatora","Wall Cult","test","kuzumi","B_head:ColonizeAI","TEST_A","hasi","yhrin","yai","henteko","SettlerX"]

httpRequest = new XMLHttpRequest()
httpRequest.open('GET', './replay/result.json', true)
httpRequest.addEventListener "load"
, ((event) =>
  if httpRequest.readyState is 4
    result = JSON.parse(httpRequest.responseText)
    text = "<h1>CEDEC 2013 AI CHALLENGE RESULT</h1>\n"
    text += "<table>\n"
    text += "<tr><th>1st</th><th>2nd</th><th>3nd</th><th>score</th><th>replay</th></tr>"
    for index of result
      game = result[index]
      rank = [game.ranks.indexOf(1),game.ranks.indexOf(2),game.ranks.indexOf(3)]
      text += "<tr>"
      for i in [0 ... 3]
        text += "<td>#{userNames[playerNames.indexOf(game.names[rank[i]])]} (#{game.names[rank[i]]})</td>"
      text += "<td>#{game.scores[rank[0]]} / #{game.scores[rank[1]]} / #{game.scores[rank[2]]}</td>"
      text += "<td>#{result[index].file}</td>"
      text += "</tr>"

    text += "</table>"
    document.body.innerHTML = text
    httpRequest = null
)
httpRequest.send(null)

