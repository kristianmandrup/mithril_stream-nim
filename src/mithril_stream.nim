import macros, dom, jsffi

{.experimental: "callOperator".}

when not defined(js):
  {.error: "Flyd.nim is only available for the JS target".}

proc add*(x, y: int): int =
  ## Adds two files together.
  return x + y

var document {.importc, nodecl.}: JsObject
var console {.importc, nodecl.}: JsObject

type
  Stream = JsObject
    `end`*: Stream

{.push importcpp.}
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
{.pop.}
