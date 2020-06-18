<cfoutput>
 <h6>Logfile: #prc.logFile#</h6>
 <table class="table table-striped table-bordered">
  <thead>
   <tr>
    <th>Severity</th>
    <th>Date</th>
    <th>Time</th>
    <th>Message</th>
   </tr>
  </thead>
  <tbody>
   <cfloop array="#prc.logs#" index="err">
    <tr>
     <td>#err.severity#</td>
     <td>#err.date#</td>
     <td>#err.time#</td>
     <td>#err.message#</td>
    </tr>
   </cfloop>
  </tbody>
 </table>
</cfoutput>
