<cfoutput>

<form class="form">
<div class="form-group row">
  <label for="url" class="col-1 col-form-label-md"><span style="line-height: 32px; font-weight: bold;">URL:</span></label>
  <div class="col-9">
   <input type="text" class="form-control" id="url" name="url" value="#prc.url#" />
  </div>
 <div class="col-1">
  <input type="submit" class="btn btn-primary" value="Go">
 </div>
</div>
</form>

<cfif !prc.data.isEmpty()>
 <cfdump var = "#prc.data#" />
</cfif>
</cfoutput>
