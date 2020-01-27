# Nim bindings for Mithril Stream JS library

[Mithril Stream](https://mithril.js.org/stream.html) is a popular choice with the [Meiosis pattern](https://meiosis.js.org/)

## API

See [Mithril Stream API](https://mithril.js.org/stream.html)

```nim
# on stream instance
proc map*(stream: Stream, fn: proc(v: Stream): Stream): Stream

# global static methods
proc stream*(value: auto): Stream {.
importcpp: "Stream(#)".}
proc combine*(combiner: proc(streams: seq[Stream]: auto, changed: seq[Stream])): Stream {.
importcpp: "Stream.combine(#)".}
proc merge*(streams: seq[Stream]): Stream {.importcpp: "Stream.merge(#)".}
proc scan*(fn: proc(value: auto): auto, accumulator: auto, stream: Stream): Stream {.
importcpp: "Stream.scan(#)".}
proc scanMerge*(pairs: seq[pairItem: auto], accumulator: auto): Stream {.
importcpp: "Stream.scan(#)".}
proc lift*(lifter: proc(streams: varargs[auto]), streams: seq[Stream]): Stream {.
importcpp: "Stream.lift(#)".}
```
