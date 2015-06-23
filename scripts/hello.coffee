greetings = [
  "Hello"
  "Hey"
  "Yo"
  "Howdy"
  "Hi"
]

module.exports = (robot) ->
  robot.respond /(hello|hey|yo|howdy|hi)/i, (res) ->
    res.send greetings[Math.floor(Math.random() * greetings.length)]