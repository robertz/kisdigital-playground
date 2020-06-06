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

<div class="row row-cols-4">
 <cfloop array="#prc.feed#" index="item">
  <div class="col mb-3">
   <div class="card h-100">
    <img src="#item.image#" class="card-img-top img-fluid w-100" alt="...">
    <div class="card-body">
     <h5 class="card-title">
      <a href="#item.url#" target="_blank" style="color: black; text-decoration: none;" title="#item.description#">#item.title#</a>
     </h5>
    </div>
   </div>
  </div>
 </cfloop>
</div>

</cfoutput>
