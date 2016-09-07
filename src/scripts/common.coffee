request = require 'superagent'

common =
    host: '//backend.0div0.com'
    fetchPage: (path, callback) ->
        request
            .get(@host + path)
            .withCredentials()
            .end (err, res) ->
                if err || !res.ok
                    console.error err
                console.log("in common res=")
                console.log(res)
                if res.body?
                    msg = res.body
                    if msg['error'] is 'redirect_auth_failure'
                        window.location ='/#/login_monitor'
                    else
                        callback(res.body)
                else callback(res)
     
    post: (path, data, callback) ->
        request
            .post(@host + path)
            .withCredentials()
            .send(data)
            .end (err, res) ->
                if err || !res.ok
                    console.error err
                msg = res.body
                if msg['error'] is 'redirect_auth_failure'
                    window.location ='/#/login_monitor'
                else
                    callback(res.body)

    readPdf:(path,callback) ->
        request
            .get(@host + path)
            .withCredentials()
            .end (err, res) ->
                if err || !res.ok
                    console.error err
                console.log("in common res=")
                console.log(res)
                if res.body?
                    msg = res.body
                    if msg['error'] is 'redirect_auth_failure'
                        window.location ='/#/login_monitor'
                    else
                        callback(res.body)
                else callback(res)

    #user profile pages
    loginMonitor: (callback) ->
        @fetchPage('/login_monitor', callback)

    PdfReader: (callback) ->
        @readPdf('/pdf', callback)


module.exports = common
