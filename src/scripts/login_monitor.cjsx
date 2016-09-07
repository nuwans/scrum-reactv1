Link = require('react-router').Link
common = require('./common')

module.exports = React.createClass
  displayName: 'LoginMonitor'

  getInitialState: ->
      {
          data: { logged_in_user: 'anonymous' }
          login_id: ''
      }

  componentDidMount: ->
      common.loginMonitor (data) =>
          current_user = data['current_user']
          whos_logged_in = 'anonymous'
          whos_logged_in = current_user if current_user
          @setState({data: { logged_in_user: whos_logged_in } })
          @setState({ login_id: data['userid'] })

  render: ->
      <div id="headerLogin" className="headerLogin">
          Current user: { @state.data.logged_in_user  }, userid: { @state.login_id }
      </div>
