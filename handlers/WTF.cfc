component extends="coldbox.system.EventHandler"{

 property name="SpiderService" inject = "model";

 function spider(event, rc, prc){
  var meta = {};
  if(rc.keyExists("url")){
   meta.append(SpiderService.spider(href = rc.url));
  }

  return meta;
 }


}
