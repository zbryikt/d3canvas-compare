$(document).ready(function(){var t,e,n,r,c,i,u,o,l,a,f,s,d,h,g,y,m,p,v,k,x,b,A;for(t=2e3,e=require("/circle.js"),e(d3,n=document.getElementById("svg"),r=function(){var e,n,r=[];for(e=1,n=t;n>=e;++e)c=e,r.push({v:c});return r}()),i=d3.select(n).selectAll("circle"),u=function(){return i.attr({cx:function(t){return t.x},cy:function(t){return t.y}})},o=d3.layout.force().nodes(r).size([800,600]).charge(function(){return-300}).on("tick",u),l=document.getElementById("canvas"),a=[$("#canvas").width(),$("#canvas").height()],f=a[0],s=a[1],d=l.getContext("2d"),l.width=f,l.height=s,d.strokeStyle="#000",h=function(){return d.beginPath(),d.fillStyle="#fff",d.rect(0,0,f,s),d.fill(),d.fillStyle="#0f0",y.selectAll("circle").each(function(){var t,e,n,r;return t=[this.getAttribute("cx"),this.getAttribute("cy"),this.getAttribute("r")],e=t[0],n=t[1],r=t[2],d.beginPath(),d.arc(e,n,r,0,2*Math.PI),d.stroke(),d.fill()}),null},g=function(t){return t.each(function(){return d3.timer(h)})},d3.ns.prefix.custom="http://tkirby.org/d3-canvas",y=document.createElementNS("http://tkirby.org/d3-canvas","sketch"),y=d3.select(y),y.call(g),p=[],v=1;t>=v;++v)c=v,p.push({v:c});return m=p,y.selectAll("circle").data(m).enter().append("custom:circle").attr({cx:function(){return Math.random()*(f-100)+50},cy:function(){return Math.random()*(s-100)+50},r:function(){return 40*Math.random()+10},fill:function(){return"#0f0"},stroke:"#000",strokeWidth:"2"}),k=y.selectAll("circle"),x=function(){return k.attr({cx:function(t){return t.x},cy:function(t){return t.y}})},b=d3.layout.force().nodes(m).size([800,600]).charge(function(){return-300}).on("tick",x),A=0,window.toggle=function(){return A?(o.stop(),b.alpha(1),b.start()):(o.alpha(1),o.start(),b.stop()),A=!A}});