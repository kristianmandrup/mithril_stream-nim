# Nim bindings for Mithril Stream JS library

[Mithril Stream](https://mithril.js.org/stream.html) is a popular choice with the [Meiosis pattern](https://meiosis.js.org/)

## API

See [Mithril Stream API](https://mithril.js.org/stream.html)

```nim
# on stream instance
proc map*(stream: Stream, fn: proc(v: Stream): Stream): Stream

# global static methods
proc stream*(value: auto): Stream
proc combine*(combiner: proc(streams: seq[Stream]: auto, changed: seq[Stream])): Stream
proc merge*(streams: seq[Stream]): Stream
proc scan*(fn: proc(value: auto): auto, accumulator: auto, stream: Stream): Stream
proc scanMerge*(pairs: seq[pairItem: auto], accumulator: auto): Stream
proc lift*(lifter: proc(streams: varargs[auto]), streams: seq[Stream]): Stream
```
