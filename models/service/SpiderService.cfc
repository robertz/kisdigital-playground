component {
 property name="jSoup" inject="javaLoader:org.jsoup.Jsoup";

 function spider(required string href) {
  var meta = {};
  cfhttp(url = href);
  var jsDoc = jSoup.parse(cfhttp.fileContent);
  var el = jsDoc.select("meta");
  var filtered = el.filter(function(its){
   return
    its.attr("name").find("twitter:") ||
    its.attr("name").find("og:") ||
    its.attr("property").find("twitter:") ||
    its.attr("property").find("og:")
  });
  filtered.each(function(i){
   len(i.attr("name")) ? meta[i.attr("name")] = i.attr("content") : meta[i.attr("property")] = i.attr("content");
  });
  return meta;
 }
}
