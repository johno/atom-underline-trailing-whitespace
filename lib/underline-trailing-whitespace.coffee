UnderlineTrailingWhitespaceView = require './underline-trailing-whitespace-view'

module.exports =
  underlineTrailingWhitespaceView: null

  activate: (state) ->
    @underlineTrailingWhitespaceView = new UnderlineTrailingWhitespaceView(state.underlineTrailingWhitespaceViewState)

  deactivate: ->
    @underlineTrailingWhitespaceView.destroy()

  serialize: ->
    underlineTrailingWhitespaceViewState: @underlineTrailingWhitespaceView.serialize()
