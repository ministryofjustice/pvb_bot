# Description:
#   Return a list of current URLs on the PVB Project
#
# Commands:
#   hubot url/urls/list envs - returns list of project urls
#   mention "ZenDesk" and "email" - returns the ZenDesk email for PVB


envs = ->
  ENVS = JSON.parse process.env.HUBOT_PROJECT_ENVS
  resp = []
  resp.push("#{name}: #{URL}") for name, URL of ENVS
  resp.join '\n'


module.exports = (robot) ->
  # Project URLS
  robot.respond /(urls?|list envs)/i, (msg) ->
    msg.send envs()

  # Project help
  robot.hear /(?=.*\bemail\b)(?=.*\bzendesk).*/i, (msg) ->
    msg.reply "The ZenDesk email for PVB feedback is prison.visits@ministryofjustice.zendesk.com"