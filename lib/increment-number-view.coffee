{View} = require 'atom'

module.exports =
class IncrementNumberView extends View
  @content: ->
    @div class: 'increment-number overlay from-top', =>
      @div "The IncrementNumber package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "increment-number:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "IncrementNumberView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
