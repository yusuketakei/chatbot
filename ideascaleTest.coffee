module.exports = (robot) ->
  robot.respond /tell me ideas$/i, (msg) ->
    apiToken = "c343ca48-9bfc-4588-819f-47f3a7db97a4" 
    msg.http("http://mhir-kobo.ideascale.com/a/rest/v1/ideas")
      .headers(api_token:apiToken)
      .get() (err,res,body) ->
        try
          json = JSON.parse(body) 
          msgStr = "ideas \n" ;
          for i,obj of json
            msgStr = msgStr + "title: \n" + obj.title + "\n" +
                     "description: \n" + obj.text + "\n"
          msg.send msgStr
        catch error
          msg.send "error: #{error}"
