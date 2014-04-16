angular.module('portfolioApp').controller "ProjectsCtrl", ($scope, $modal) ->
  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: '/templates/project.html'
    )
