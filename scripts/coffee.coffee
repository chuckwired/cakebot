# Description:
#   Last calls for Cake coffee!
#
# Notes:
#   

#schedule = require 'node-schedule'
moment = require 'moment-timezone'

module.exports = (robot) ->
  robot.respond /(coffee)/i, (msg) ->
    now = moment(new Date()).toDate() #current timezone
    
    theHour = () -> 
      if now.getDay() == 5
        now.getHours() + 1
      else 
        now.getHours()
    theMinute = now.getMinutes()
    
    if theHour() <= 16 && theMinute <= 45 #< 4:50pm
      msg.send "There is still time for coffee!"
    if theHour() > 17 # 5pm
      msg.send "Cake Coffee is CLOSED."
    if theHour() >= 16 && theMinute >= 45
      msg.send "@Cornel, @Ani, @Andrew, last call for coffees! :bell:"
