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
//= require foundation
//= require clipboard
//= require_tree .

//Foundation alert box timeout
$(function(){
  var clearAlert = setTimeout(function(){
    $(".alert-box").fadeOut('slow')
  }, 3500);

  $(document).on("click", ".alert-box a.close", function(event){
    clearTimeout(clearAlert);
  });

  $(document).on("click", ".alert-box a.close", function(event) {
    event.preventDefault();
    $(this).closest(".alert-box").fadeOut(function(event){
      $(this).remove();
    });
  });
});

//Click Image URL text field and highlight
$(function(){
  $(".image-url-box").click( function() {
    this.select();
  });
});

//Only allow one click on upload
$(function(){
  $("input[type=submit]").click(function() {
    $(event.target).attr("disabled", true);
    $(event.target).closest('form').submit();
  });
});

//Needed for Foundation to run in Rails
$(function() {
  $(document).foundation();
});
