component {
 property name="LogService" inject="model";

 function readLog (event, rc, prc) {
  return LogService.readLogfile({logfile: "https://raw.githubusercontent.com/robertz/payloads/master/links.log"});
 }

}
