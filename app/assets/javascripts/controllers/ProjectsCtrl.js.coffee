angular.module('portfolioApp').controller "ProjectsCtrl", ($scope, $modal, $location, $routeParams, Project, $timeout) ->
  $scope.init = ->
    @projectService = new Project(serverErrorHandler)
    $scope.projects = @projectService.all()

  $scope.createProject = ->
    project = @projectService.create($scope.newProject)
    $scope.projects.unshift(project)
    $scope.newProject = {}

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")

  $scope.open = (project) ->
    modalInstance = $modal.open(
      templateUrl: '/templates/project.html'
    )
  # $http.get("projects/" + $routeParams.projectId + ".json").success (data) ->
  #   $scope.project = data
  #   $scope.mainImageUrl = data.images[0]
  #   return

  $scope.imageurl = ''
  $scope.shareHtml = "<p> just a paragraph</p>"

  $timeout (->
    $scope.path = ""
    return
  ), 1000


