
$(document).ready(function() {
   $("[id$=-element-type]").each(function() {
     var field = $(this).parent();
     var link_field = field.find("[id$=-link]");
     var text_field = field.find("[id$=-text]");
     var image_field = field.find("[id$=-image]");
     var type_field = field.find("[id$=-element-type]");
     var type = type_field.val();
     console.log(type);
     console.log("------");
     if (type == "link") {
       link_field.show();
       text_field.hide();
       image_field.hide();
     } else if (type == "text") {
       link_field.hide();
       text_field.show();
       image_field.hide();
     } else if (type == "image") {
       link_field.hide();
       text_field.hide();
       image_field.show();
     } else {
       link_field.show();
       text_field.hide();
       image_field.hide();
     }
   });
 });


 function readURL(input, img_id) {
   img_id = "#" + img_id;
   if (input.files && input.files[0]) {
     var reader = new FileReader();
     reader.onload = function (e) {
       $(img_id).attr("src", e.target.result);
       $(img_id).show();
     };
     reader.readAsDataURL(input.files[0]);
   }
 }

 function readRemoteURL(input, img_id) {
   img_id = "#" + img_id;
   img_url = $(input);
   var $parent = $(img_id).parent();
   var $nullWarning = $parent.find(".null-warning");
   if (img_url != "") {
     $(img_id).attr("src", img_url.val());
     $(img_id).show();
     $nullWarning.hide();
     $(img_id).error(function() {
       $(img_id).attr("src", "");
       $(img_id).hide();
       $nullWarning.show();
     });
   } else {
     $(img_id).attr("src", "");
     $(img_id).hide();
     $nullWarning.hide();
   }
 }



 function addNewElement(type) {
   $(this).on("nested:fieldAdded:article_collections", function(event) {
     var field = event.field;
     var link_field = field.find("[id$=-link]");
     var text_field = field.find("[id$=-text]");
     var image_field = field.find("[id$=-image]");
     var type_field = field.find("[id$=-element-type]");
     if (type == "recipe") {
       link_field.show();
       text_field.hide();
       image_field.hide();
     } else if (type == "text") {
       link_field.hide();
       text_field.show();
       image_field.hide();
     } else {
       link_field.hide();
       text_field.hide();
       image_field.show();
     }
     type_field.val(type);
   });
 }
