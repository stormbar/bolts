# name: IP Address
# description: Find out your public IP address
# keyword: ip
# homepage: https://github.com/stormbar/bolts/tree/master/ip

bolt.run ->
  http.getJSON 'http://jsonip.com/?', (data) ->
    result
      title: data.ip
      description: 'Your public IP address'