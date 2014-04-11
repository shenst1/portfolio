jdconsultingApp = angular.module('jdconsultingApp', ['ngResource', 'mk.editablespan', 'ui.sortable'])

jdconsultingApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

jdconsultingApp.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/dashboard', templateUrl: '/templates/dashboard.html', controller: 'DashboardController'
  $routeProvider.when '/talks', templateUrl: '/templates/talks.html'
  $routeProvider.when '/consulting', templateUrl: '/templates/consulting.html'
  $routeProvider.when '/contact', templateUrl: '/templates/contact.html'


# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
