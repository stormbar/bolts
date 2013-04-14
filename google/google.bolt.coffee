# name: Google Search
# description: Search the internet via Google
# keyword: google
# homepage: http://google.com

bolt.run ->
  if command.hasQuery

    url = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q="+command.query+"&callback=?"
    http.getJSON url, (data) ->
      if data.responseData
        for item in data.responseData.results
          result
            title:       utils.sanitize(utils.unescape(item.title))
            description: utils.sanitize(utils.unescape(item.content))
            action:      actions.open(item.url)
            icon:        "/images/google.png"
      else
        result
          title:       "Query Failed!"
          description: "Google Failed to serve this query. Try Again?"
          action:      actions.repeat()

  else

    result
      title:       meta.name
      description: "Type your query to continue"