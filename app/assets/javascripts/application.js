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
//= require_tree .

$(function(){ $(document).foundation(); });
$(function() {
   $('.notice').delay(300).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
   });
});
$(function() {
   $('.alert').delay(300).fadeIn('normal', function() {
      $(this).delay(2500).fadeOut();
   });
});

$(function() {
   $('#delete').on('click', function(e) {
      e.preventDefault();
      var confirm = window.confirm("Are you sure you want to delete this question?")
      if( confirm == true ){
          return true;
      }else{
          return false;
      }
   });
});
