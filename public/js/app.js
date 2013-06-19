/*global $ */
/*jshint unused:false */
var app = app || {};
var ENTER_KEY = 13;

    _.templateSettings = {
    evaluate: /\{\{([\s\S]+?)\}\}/g,
    interpolate: /\{\{=([\s\S]+?)\}\}/g
    };

$(function () {
	'use strict';



	// kick things off by creating the `App`
	new app.AppView();
});
