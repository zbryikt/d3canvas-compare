require! <[fs d3 jsdom ./share/circle svg2png]>

size = 20000
doc = jsdom.jsdom!
svg = doc.createElement \svg
  ..set-attribute \width, "800"
  ..set-attribute \height, "600"
  ..set-attribute \xmlns, "http://www.w3.org/2000/svg"
data = []
for i from 0 til size => data.push i
circle d3, svg, data, true
fs.write-file-sync \static-many.svg, svg.outerHTML

svg2png \static-many.svg, \static-many.png, (e) ->

