module.exports =
class UnderlineTrailingWhitespaceView
  constructor: (serializeState) ->
    # Register command that toggles this view
    atom.commands.add 'atom-workspace', 'underline-trailing-whitespace:toggle': => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->

  # Toggle the visibility of this view
  toggle: ->
