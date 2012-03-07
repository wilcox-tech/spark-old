// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var precond_count = 0;
        
function addAnotherPrecond(box_num)
{
  var the_elem = objectFromId("preconds");

  if(box_num < precond_count) { return; }
  precond_count += 1;
  
  var span_num = document.createElement("span");
  span_num.innerHTML = precond_count + ". ";
  
  var text_box = document.createElement("input");
  text_box.id = precond_count;
  text_box.type = "text";
  text_box.name = "story[preconds][" + precond_count + "]";
  text_box.size = 30;
  
  the_elem.appendChild(span_num);
  the_elem.appendChild(text_box);
  the_elem.appendChild(document.createElement("br"));
}

$(function() {
  addAnotherPrecond(0);
  $("#preconds input[type=text]").last().keydown(function() { if(this.value !== "") { addAnotherPrecond(this.id); } });
});
