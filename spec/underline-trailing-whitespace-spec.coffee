{WorkspaceView} = require 'atom'
UnderlineTrailingWhitespace = require '../lib/underline-trailing-whitespace'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "UnderlineTrailingWhitespace", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('underline-trailing-whitespace')

  describe "when the underline-trailing-whitespace:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.underline-trailing-whitespace')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch atom.workspaceView.element, 'underline-trailing-whitespace:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.underline-trailing-whitespace')).toExist()
        atom.commands.dispatch atom.workspaceView.element, 'underline-trailing-whitespace:toggle'
        expect(atom.workspaceView.find('.underline-trailing-whitespace')).not.toExist()
