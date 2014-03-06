IncrementNumberView = require './increment-number-view'

module.exports =
  incrementNumberView: null

  activate: (state) ->
    # 21
    # 17
    # @incrementNumberView = new IncrementNumberView(state.incrementNumberViewState)
    atom.workspaceView.command "increment-number:increase", => @doProcess(true)
    atom.workspaceView.command "increment-number:decrease", => @doProcess(false)

  doProcess: (increase)->
    editor = atom.workspaceView.getActivePaneItem()
    (@selectionRanges editor).forEach (range) ->
      num = Number(editor.getTextInBufferRange range )
      if !isNaN(num)
        num += if increase then 1 else -1
        # console.log 'increment', increase, num
        editor.setTextInBufferRange(range, String(num))
    return

  selectionRanges: (editor)->
    editor.getSelectedBufferRanges().filter (range) ->
      not range.isEmpty()

  deactivate: ->
    # @incrementNumberView.destroy()

  serialize: ->
    # incrementNumberViewState: @incrementNumberView.serialize()
