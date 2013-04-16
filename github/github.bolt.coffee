# name: Github repo search
# description: Search Github.com for public repositories
# keyword: github
# homepage: http://www.github.com

bolt.run ->
  if command.hasQuery
    url = "https://api.github.com/legacy/repos/search/" +command.query+ "?callback=?"
    http.getJSON url, (results) ->
      repositories = results.data.repositories
      if repositories.length > 0
        for item in repositories
          result
            title: utils.sanitize(item.name)
            description: utils.sanitize("#{item.language} - #{item.description}")
            action: actions.open(item.url)
      else
        result
          title: "No results or the query failed",
          description: "Try Again?",
          action: actions.repeat()
  else
    result
      title: meta.name
      description: "Type your query to continue"