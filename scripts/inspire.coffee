module.exports = (robot) ->

  inspirations = require '../config/inspirations'
  fs = require 'fs'


  robot.respond /inspire me/i, (res) ->
    res.send inspirations[Math.floor(Math.random() * inspirations.length)]

  robot.hear /(.*) #inspiration/i, (res)->
    inspirations.push res.match[1]
    console.log __dirname
    fs.writeFile "./config/inspirations.json", JSON.stringify inspirations, "utf8", (err)->
    res.send 'I\'ll remember that!'
