component {

 function readLogfile (required struct criteria) {
  var logfile = criteria.keyExists("logfile") ? criteria.logfile : "";
  var data = {
   'response': {
    'log': []
   },
   'meta_data': {
    'status' = "success",
    'code' = 200,
    'type' = "OK",
    'message' = ""
   },
   'errors': []
  };
  var lines = [];
  try{
   cfhttp(url = logfile);
   if(cfhttp.responseHeader.status_code == "200"){
    var logs = cfhttp.fileContent.listToArray(chr(10));
    // skip the headers
    for(var i = 2; i <= logs.len(); i++){
     // parse the positions for log4j
     var sv = replace(logs[i].listGetAt(1), """", "", "all"); // severity
     var td = replace(logs[i].listGetAt(2), """", "", "all"); // threadid
     var dt = replace(logs[i].listGetAt(3), """", "", "all"); // date
     var tm = replace(logs[i].listGetAt(4), """", "", "all"); // time
     var ap = replace(logs[i].listGetAt(5), """", "", "all"); // application
     var ms = replace(logs[i].listGetAt(6), """", "", "all"); // message
     // strip the message from the log line
     var tmp = logs[i];
     tmp = tmp
      .replace(sv, "")
      .replace(td, "")
      .replace(dt, "")
      .replace(tm, "")
      .replace(ap, "")
      .replace('"","","","","","', "");
     tmp = left(tmp, tmp.len() - 1);
     lines.append({
      'severity': sv,
      'date': dt,
      'time': tm,
      'message': encodeForHTML(tmp),
      'utc': DateDiff("s", "January 1 1970 00:00", DateConvert("Local2utc", parseDateTime(dt & " " & tm)))
     });
    }
   }
   arraySort(lines, function(e1, e2){
    // descending sort by utc timestamp
    return compare(e2.utc, e1.utc);
   });
   // merge in to response.log
   data.response.log.append(lines, true);
  }
  catch(any e) {
   data['errors'].append("Invalid log file format or parsing error");
   data['meta_data']['code'] = 500;
   data['meta_data']['status'] = "error";
   data['meta_data']['type'] = "error";
  }
  return data;
 }

}
