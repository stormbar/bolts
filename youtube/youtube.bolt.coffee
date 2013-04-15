# name: YouTube
# description: Search YouTube videos and watch inline.
# keyword: youtube
# homepage: https://github.com/stormbar/bolts/tree/master/youtube

bolt.run ->
  if command.hasQuery
    url = "http://gdata.youtube.com/feeds/api/videos?vq=#{escape(command.query)}&max-results=5&alt=json-in-script&callback=?"
    http.getJSON url, (data) ->
      for item in data.feed.entry
        id = item.id.$t.match(/\/([\-\w]+?)$/)[1]
        title = item.title.$t
        category = item['media$group']['media$category'][0].$t
        author = item.author[0].name.$t
        thumb = item['media$group']['media$thumbnail']?[0]?.url
        result
          title: title
          description: "a #{category} video by #{author}"
          icon: thumb
          action: actions.iframe("http://www.youtube.com/embed/#{id}?autoplay=1")

  else
    result
      title: meta.name
      description: 'Type a search query...'
