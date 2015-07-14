<- $ document .ready

render = require("/circle.js")
start = new Date!
render d3, document.getElementById("svg"), [1 to 20000]
end = new Date!
$(\#time1).text("#{end.getTime! - start.getTime!}ms")

setTimeout (->
  canvas = document.getElementById("canvas")
  [w,h] = [$(\#canvas).width!, $(\#canvas).height!]
  ctx = canvas.getContext("2d")
  canvas.width = w
  canvas.height = h
  ctx.fill-style = \#0f0
  ctx.stroke-style = \#000

  redraw = -> 
    start = new Date!
    sketch.selectAll("circle").each(-> 
      [cx,cy,r] = [@getAttribute("cx"), @getAttribute("cy"),@getAttribute("r")]
      ctx.beginPath!
      ctx.arc(cx, cy, r, 0, 2 * Math.PI)
      ctx.stroke!
      ctx.fill!
    )
    end = new Date!
    $(\#time2).text("#{end.getTime! - start.getTime!}ms")
    1
  custom = (sel) -> sel.each -> d3.timer redraw

  d3.ns.prefix.custom = "http://tkirby.org/d3-canvas"
  sketch = document.createElementNS("http://tkirby.org/d3-canvas","sketch")
  sketch = d3.select(sketch)
  sketch.call(custom)
  sketch.selectAll("circle").data([1 to 20000]).enter().append("custom:circle").attr do
    cx: -> Math.random!*(w - 100) + 50
    cy: -> Math.random!*(h - 100) + 50
    r: -> Math.random! * 40 + 10
    fill: -> \#0f0
    stroke: \#000
    stroke-width: \2
), 2000

getimage = (url, id, iid) ->
  img = new Image!
  img.onload = ->
    end = new Date!
    $(id).text("#{end.getTime! - img.start.getTime!}ms")
    $(iid).0.appendChild(img)
  img.src = url
  img.start = new Date!

setTimeout (-> getimage \static-many.svg, \#time3, \#img3), 4000
setTimeout (-> getimage \static-many.png, \#time4, \#img4), 6000

