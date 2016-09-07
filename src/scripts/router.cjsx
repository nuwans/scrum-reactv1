# Load css first thing. It gets injected in the <head> in a <style> element by
# the Webpack style-loader.
require '../../public/main.css'

React = require 'react'
Router = require('react-router')
ReactDOM = require 'react-dom'
{ReactRouter, Router, Route, useRouterHistory} = require 'react-router'

# Assign React to Window so the Chrome React Dev Tools will work.
window.React = React

{createHashHistory, createHistory} = require 'history'

history = useRouterHistory(createHashHistory)({ queryKey: false })

# Require route components.
HelloWorld = require './hello_world'
LoginMonitor = require './login_monitor'
StyleGuide = require './styleguide'
Pdf = require './pdf'
App = require './app'
Editor =require './editor'

routes = (
  <Route>
    <Route name="hello" component={HelloWorld} path="/" />
    <Route name="styleguide" component={StyleGuide} path="/styleguide" />
    <Route name="loginmonitor" component={LoginMonitor} path="/login_monitor" />
    <Route name="pdf" component={Pdf} path="/pdf" />
    <Route name="editor" component={Editor} path="/editor" />
  </Route>
)

ReactDOM.render(<Router history={history}>{routes}</Router>, document.getElementById 'app')
