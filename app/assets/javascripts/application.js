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
//= require bootstrap
//= require_tree .

$(function () {
  // see https://gist.github.com/pinchyfingers/2414459
  sidebarwidth = $(".sidebar-width").css('width');
  bodypaddingtop = $(".navbar-fixed-top").css('height');
  sidebarheight = $("body").css('height');
  $('.sidebar-nav-fixed').css('width', sidebarwidth);
  $('.sidebar-nav-fixed').css('height', sidebarheight);
  $('body').css('paddingTop', bodypaddingtop)
  contentmargin = parseInt(sidebarwidth)
  $('.span-fixed-sidebar').css('marginLeft', contentmargin);
  $('.span-fixed-sidebar').css('paddingLeft', 60);

  /*
  $(document).ready(function () {
    $('a[href="' + this.location.pathname + '"]').parent().addClass('active');
  });
  */
  // see http://stackoverflow.com/questions/9879169/how-to-get-twitter-bootstrap-navigation-to-show-active-link
  if (window.location.pathname.match('/users')) {
    $('.navbar .nav').find('a[href="/users/sign_in"]').parent().addClass('active');
  } else {
    $('.navbar').find('.nav').find('a[href="' + window.location.pathname + '"]').parent().addClass('active');
  }
});
