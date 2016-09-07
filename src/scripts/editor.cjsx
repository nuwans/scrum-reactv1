Link = require('react-router').Link
x=require('ckeditor')
$=require('jquery')
module.exports = React.createClass
  displayName: 'Editor'
  getInitialState: ->
    {
    }
  noteditable: ->
    document.getElementById("fullarticle").setAttribute("contenteditable", "false")
    @setState({editable:true})
    CKEDITOR.instances.fullarticle.destroy()
  openEditor: ->
   document.getElementById("fullarticle").setAttribute("contenteditable", "true")
   CKEDITOR.replace( 'fullarticle' )
   #console.log(CKEDITOR.basePath)
  render: ->
      <div>
        Sample  Text Editor  with Equation  editor  
        
         <textarea id = "fullarticle" onClick={@openEditor} ></textarea>
         <button onClick={@noteditable}>Save</button>
      </div>
