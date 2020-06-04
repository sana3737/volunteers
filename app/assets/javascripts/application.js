// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery_nested_form

$(function() {
  function setFieldNum(e){
    $("div.fields:visible div.order-box.materials span").each(function(index, element) {
      $(this).text(index + 1);
    });
    $("div.fields:visible div.order-box.tools span").each(function(index, element) {
      $(this).text(index + 1);
    });

    $("div.fields:visible div.order-box.steps span").each(function(index, element) {
      $(this).text(index + 1);
    });
  }
  $(document).on('nested:fieldAdded', function(e) {
    setFieldNum(e);
    var link = $(e.currentTarget.activeElement);
    if (!link.data('limit')) {
      return;
    }
    if (link.siblings('.fields:visible').length >= link.data('limit')) {
      link.hide();
    }
  });

  $(document).on('nested:fieldRemoved', function(e) {
    setFieldNum(e);
    var link = $(e.target).siblings('a.add_nested_fields');
    if (!link.data('limit')) {
      return;
    }
    if (link.siblings('.fields:visible').length < link.data('limit')) {
      link.show();
    }
  });
})
