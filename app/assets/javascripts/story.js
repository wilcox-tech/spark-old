// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var type_counts = new Array;
type_counts["preconds"] = 0;
type_counts["normal_flow"] = 0;
        
function addAnotherBox(box, type)
{
  var the_elem = objectFromId(type);

  if(box !== null && parseInt(box.id.substring(99, type.length)) < type_counts[type]) { return; }
  $(box).change(function() { });
  type_counts[type] += 1;
  
  var span_num = document.createElement("span");
  span_num.innerHTML = type_counts[type] + ". ";
  
  var text_box = document.createElement("input");
  text_box.id = type + type_counts[type];
  text_box.type = "text";
  text_box.name = "story["+type+"][" + type_counts[type] + "]";
  text_box.size = 60;
  $(text_box).keydown(function() { if(this.value !== "") { addAnotherBox(text_box, type); } });
  
  the_elem.appendChild(span_num);
  the_elem.appendChild(text_box);
  the_elem.appendChild(document.createElement("br"));
}

