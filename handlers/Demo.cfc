component extends="coldbox.system.EventHandler" {

 property name="SpiderService" inject="model";

 function index (event, rc, prc) {
  event.setView('demo/index');
 }

 function spider (event, rc, prc) {
  prc['url'] = event.getValue("url", "https://www.usatoday.com/story/travel/news/2020/05/03/disney-world-what-is-discovery-island-where-man-caught-camping/3074416001/");
  prc['data'] = {};

  if (prc.url.len()) {
   prc.data.append(SpiderService.spider(href = prc.url));
  }

  event.setView('demo/spider');
 }

}
