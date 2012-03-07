// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function objectFromBrokenNetscapeRenderer(obj, name)
{
  var x = obj.layers;
  var foundLayer;
  for (var i = 0; i < x.length; i += 1)
  {
    if(x[i].id == name)
    {
      foundLayer = x[i];
    }
    else if(x[i].layers.length)
    {
      var tmp = objectFromBrokenNetscapeRenderer(x[i], name);
      if(tmp) { foundLayer = tmp; }
    }
  }
  return foundLayer;
}

function objectFromId(name)
{
  if(document.getElementById)
  {
    return document.getElementById(name);
  }
  else if(document.all)
  {
    return document.all[name];
  }
  else if(document.layers)
  {
    // Netscape!  YAY!
    return objectFromBrokenNetscapeRenderer(document,name);
  }
}
