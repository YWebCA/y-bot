module.exports = (robot) ->

  robot.brain.on 'loaded', ->
    if !robot.brain.inspirations?
      robot.brain.inspirations = []

    robot.respond /inspire me/i, (res) ->
      res.send robot.brain.inspirations[Math.floor(Math.random() * robot.brain.inspirations.length)]

    robot.hear /(.*) #inspiration/i, (res)->
      robot.brain.inspirations.push res.match[1]
      robot.brain.emit 'save'
      res.send 'Thanks, I\'ll remember!'
