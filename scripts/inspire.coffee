module.exports = (robot) ->

  robot.brain.on 'loaded', ->
    robot.brain.inspirations = [] unless robot.brain.inspirations

    robot.respond /inspire me/i, (res) ->
      if robot.brain.inspirations.length > 0
        res.send robot.brain.inspirations[Math.floor(Math.random() * robot.brain.inspirations.length)]
      else
        res.send "I don't feel inspired right now. Use #inpiration to inspire me."

    robot.hear /(.*) #inspiration/i, (res)->
      robot.brain.inspirations.push res.match[1]
      robot.brain.emit 'save'
      res.send 'Thanks, I\'ll remember!'
