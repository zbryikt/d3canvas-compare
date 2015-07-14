<- $ document .ready

render = require("/circle.js")
start = new Date!
render d3, document.getElementById("svg"), [1 to 20000]
end = new Date!
$(\#time1).text("#{end.getTime! - start.getTime!}ms")

getimage = (url, id, iid) ->
  img = new Image!
  img.onload = ->
    end = new Date!
    $(id).text("#{end.getTime! - img.start.getTime!}ms")
    $(iid).0.appendChild(img)
  img.src = url
  img.start = new Date!

setTimeout (-> getimage \static-many.svg, \#time2, \#img2), 2000
setTimeout (-> getimage \static-many.png, \#time3, \#img3), 4000
