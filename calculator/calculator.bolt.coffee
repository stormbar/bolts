# name: Calculator
# description: A basic calculator interface
# keyword: calc
# homepage: https://github.com/stormbar/bolts/tree/master/calculator

bolt.run ->
  if command.hasQuery
    try
      answer = eval(command.query)
      result
        title: answer
        description: 'hit enter to use answer...'
        action: actions.fillCommand(meta.keyword, answer)
    catch e
      result
        title: '???'
        description: e.message

  else
    result
      title:       meta.name
      description: "Type a calculation to continue..."