portfolioApp = angular.module('portfolioApp', ['ngResource', 'mk.editablespan', 'ui.sortable'])

portfolioApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

portfolioApp.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/dashboard', templateUrl: '/templates/dashboard.html', controller: 'DashboardController'
  $routeProvider.when '/projects', templateUrl: '/templates/projects.html'
  $routeProvider.when '/technology', templateUrl: '/templates/technology.html'
  $routeProvider.when '/about', templateUrl: '/templates/about.html'
  $routeProvider.when '/contact', templateUrl: '/templates/contact.html'


# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
