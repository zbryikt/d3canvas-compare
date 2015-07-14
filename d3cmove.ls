<- $ document .ready

size = 2000

render = require("/circle.js")
render d3, svg = document.getElementById("svg"), nodes1 = [{v: i} for i from 1 to size]
circles1 = d3.select(svg).selectAll \circle
tick1 = ->
  circles1.attr do
    cx: -> it.x
    cy: -> it.y

force1 = d3.layout.force!nodes nodes1 .size [800 600] .charge(-> -300).on(\tick, tick1)

canvas = document.getElementById("canvas")
[w,h] = [$(\#canvas).width!, $(\#canvas).height!]
ctx = canvas.getContext("2d")
canvas.width = w
canvas.height = h
ctx.stroke-style = \#000

redraw = -> 
  ctx.beginPath!
  ctx.fill-style = \#fff
  ctx.rect(0,0,w,h)
  ctx.fill!
  ctx.fill-style = \#0f0
  sketch.selectAll("circle").each(-> 
    [cx,cy,r] = [@getAttribute("cx"), @getAttribute("cy"),@getAttribute("r")]
    ctx.beginPath!
    ctx.arc(cx, cy, r, 0, 2 * Math.PI)
    ctx.stroke!
    ctx.fill!
  )
  null

custom = (sel) -> sel.each -> d3.timer redraw

d3.ns.prefix.custom = "http://tkirby.org/d3-canvas"
sketch = document.createElementNS("http://tkirby.org/d3-canvas","sketch")
sketch = d3.select(sketch)
sketch.call(custom)
nodes2 = [{v: i} for i from 1 to size]
sketch.selectAll("circle").data(nodes2).enter().append("custom:circle").attr do
  cx: -> Math.random!*(w - 100) + 50
  cy: -> Math.random!*(h - 100) + 50
  r: -> Math.random! * 40 + 10
  fill: -> \#0f0
  stroke: \#000
  stroke-width: \2

circles2 = sketch.selectAll(\circle)
tick2 = ->
  circles2.attr do
    cx: -> it.x
    cy: -> it.y
force2 = d3.layout.force!nodes nodes2 .size [800 600] .charge(-> -300).on(\tick, tick2)


state = 0
window.toggle = ->
  if !state =>
    force1.alpha 1
    force1.start!
    force2.stop!
  else 
    force1.stop!
    force2.alpha 1
    force2.start!
  state := !!!state
