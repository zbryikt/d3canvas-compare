render = (d3, node, data, is-server = false) ->
  d3.select(node).selectAll("circle").data(data)
    ..enter!append \circle .attr do
      cx: -> Math.random! * 600 + 100
      cy: -> Math.random! * 400 + 100
      r: -> Math.random! * 40 + 10
      fill: -> if is-server => \#f00 else \#00f
      stroke: \#000
      stroke-width: \2

module.exports = render
