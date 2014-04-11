jdconsultingApp = angular.module('jdconsultingApp', ['ngResource', 'mk.editablespan', 'ui.sortable'])

jdconsultingApp.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

jdconsultingApp.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when '/dashboard', templateUrl: '/templates/dashboard.html', controller: 'DashboardController'
  $routeProvider.when '/task_lists/:list_id', templateUrl: '/templates/task_list.html', controller: 'TodoListController'
  $routeProvider.when '/talks', templateUrl: '/templates/talks'
  $routeProvider.when '/settings', templateUrl: '/templates/settings.html', controller: 'SettingsController'
  $routeProvider.when '/reports', templateUrl: '/templates/reports.html', controller: 'ReportsController'
  $routeProvider.when '/welcome', templateUrl: '/templates/welcome.html', controller: 'WelcomeController'

# Makes AngularJS work with turbolinks.
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
