lasertoothApp = angular.module('lasertoothApp', ['ngResource', 'mk.editablespan', 'ui.sortable'])

lasertoothApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

lasertoothApp.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/', redirectTo: '/dashboard'
  $routeProvider.when '/dashboard', templateUrl: '/templates/dashboard.html', controller: 'DashboardController'
  $routeProvider.when '/task_lists/:list_id', templateUrl: '/templates/task_list.html', controller: 'TodoListController'
  $routeProvider.when '/settings', templateUrl: '/templates/settings.html', controller: 'SettingsController'
  $routeProvider.when '/reports', templateUrl: '/templates/reports.html', controller: 'ReportsController'
# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
