// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs

//= require spree/frontend

//= require_tree .


function contactOverlay(name_on) {
    var l_on = document.getElementById(name_on);
    l_on.className = '';
}

function closeOverlay(name_off) {
    var l = document.getElementById(name_off);
    l.className = 'back_overlay';
}


//= require spree/frontend/spree_i18n
