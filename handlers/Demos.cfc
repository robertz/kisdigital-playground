component extends="coldbox.system.EventHandler" {

 property name="SpiderService" inject="model";

 function index (event, rc, prc) {
  event.setView('demos/index');
 }

 function spider (event, rc, prc) {
  prc['url'] = event.getValue("url", "");
  prc['data'] = {};
  if (prc.url.len()) {
   prc.data.append(SpiderService.spider(linkUrl = prc.url));
  }
  event.setView('demos/spider');
 }

 function feed (event, rc, prc) {
  if(!application.keyExists("feed")) application['feed'] = [];
  prc['feed'] = [];
  prc['url'] = event.getValue("url", "");
  if (prc.url.len()) {
   var meta = SpiderService.spider(linkUrl = prc.url);
   var tmp = {
    'title': meta.keyExists("twitter:title") ? meta['twitter:title'] : meta['og:title'],
    'description': meta.keyExists("twitter:description") ? meta['twitter:description'] : meta['og:description'],
    'image': meta.keyExists("twitter:img:src") ? meta['twitter:img:src'] : meta['og:image'],
    'url': meta.keyExists("twitter:url") ? meta['twitter:url'] : meta['og:url']
   };
   var exists = application.feed.filter(function(i){
    return i.url == tmp.url;
   }).len() ? true : false;
   if(!exists) application.feed.append(tmp);
  }
  prc.feed.append(application.feed, true);
  event.setView('demos/feed');
 }

}
