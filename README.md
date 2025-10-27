# Simple Dialogue Godot Plugin

A very simple dialogue plugin for my game projects.

## Features

### Resources

This plugin adds the `Character` and `DialogueLine` resources.

- A `Character` simply has a name.
- A `DialogueLine` has a speaker (a `Character`), a line, and can trigger an
  optional callback.
  
### Nodes

This plugin works with two main nodes:

- `DialogueHolder`: This node holds an array of `DialogueLine`s and sends them
  to a specified `DialogueDisplay` node.
- `DialogueDisplay`: A UI element which can display dialogue. It has a mode to
  display text progressively.

### Usage

Simply drop a `DialogueHolder` in your scene and fill it with `DialogueLine`s.
Create `Character` resources if needed, these define the name of the speaker
when dialogue is displayed.

The `DialogueHolder` can simply play automatically when the scene is loaded
(tick `autoplay`), or can be trigger by any node by calling its `play`
function.

When calling `play`, the `DialogueHolder` will play all its dialogue. If you
want to split dialogue in multiple different pieces, use different
`DialogueHolder`s.
