component extends="coldbox.system.EventHandler" {

 property name="SpiderService" inject="model";

 function index (event, rc, prc) {
  event.setView('demos/index');
 }

 function spider (event, rc, prc) {
  prc['url'] = event.getValue("url", "");
  prc['data'] = {};
  if (prc.url.len()) {
   prc.data.append(SpiderService.spider(href = prc.url));
  }
  event.setView('demos/spider');
 }

}
