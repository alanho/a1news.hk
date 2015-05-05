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
//= require twitter/bootstrap
//= require_tree .

$(function(){
  $("a[data-source]").on("click", function(e){
    _gaq.push(['_trackPageview', "/"+$(this).data("source")]);
  })

  $(window).scroll(function() {
    if($(window).scrollTop() + $(window).height() == $(document).height()) {
      $("#covers-container .pager-loader").click();
    }
  });

  $(".cover a").tooltip();

  $("#covers-container").on("click", ".pager-loader", function(e){
    e.preventDefault();
    var that = $(this);
    var url = that.attr("href")
    that.remove();

    $.get(url).done(function(data){
      $("#covers-container").append(data);
    })
  })

  var konami = new Konami();
  konami.code = function() {
    
  }
  konami.load();
})