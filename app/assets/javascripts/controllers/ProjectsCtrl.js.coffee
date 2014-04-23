angular.module('portfolioApp').controller "ProjectsCtrl", ($scope, $modal, $location, $routeParams, Project) ->
  $scope.init = ->
    @projectService = new Project(serverErrorHandler)
    $scope.projects = @projectService.all()

  $scope.createProject = ->
    project = @projectService.create($scope.newProject)
    $scope.projects.unshift(project)
    $scope.newProject = {}

    #to do app way
    # task = @taskService.create(description: $scope.taskDescription)
    # task.priority = 1
    # $scope.list.tasks.unshift(task)
    # $scope.taskDescription = ""

    #unity way
    # @unity3dAppCtrl = ["$scope", "Promotion", ($scope, Promotion) ->
    # $scope.promotions = Promotion.query()

    # $scope.addPromotion = ->
    #   promotion = Promotion.save($scope.newPromotion)
    #   $scope.promotions.push(promotion)
    #   $scope.newPromotion = {}
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



