Link = require('react-router').Link
common = require('./common')
LoginMonitor = require('./login_monitor')
module.exports = React.createClass
  displayName: 'Pdf'

  getInitialState: ->
      {
          data: { logged_in_user: 'anonymous' }
          login_id: '',
          encoded:''
      }
  componentWillMount: ->
    @setState({encoded:'data:application/pdf;'})
    console.log(@state.encoded)
  componentDidMount: ->
      common.PdfReader (data) =>
          returnstring='data:application/pdf;base64,'+data['text']
          @setState({encoded:returnstring})

  render: ->
    
      <div id="headerLogin" className="headerLogin">
       <LoginMonitor />
         <iframe src={@state.encoded} width="90%" height="400px"></iframe>
      </div>
