angular.module('portfolioApp').controller "ProjectsCtrl", ($scope, $modal, $location, $routeParams, Project) ->
  $scope.init = ->
    @projectService = new Project(serverErrorHandler)
    $scope.projects = @projectService.all()

  $scope.createProject = (title) ->
    @projectService.create title: title, (project) ->
        $location.url("/projects/#{project.id}")
    console.log "got past create method"

  # $scope.deleteProject = (project, index) ->
  #   result = confirm "Are you sure you want to remove this project?"

  #   if result
  #     @projectService.delete project
  #     $scope.projects.splice index, 1

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")

  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: '/templates/project.html'
    )



