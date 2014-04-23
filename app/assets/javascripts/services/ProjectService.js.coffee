angular.module('portfolioApp').factory 'Project', ($resource, $http) ->
  class Project
    constructor: (errorHandler) ->
      @service = $resource('/api/projects/:id',
        {id: '@id'},
        {update: {method: 'PATCH'}})
      @errorHandler = errorHandler

      # Fix needed for the PATCH method to use application/json content type.
      defaults = $http.defaults.headers
      defaults.patch = defaults.patch || {}
      defaults.patch['Content-Type'] = 'application/json'

    create: (attrs, successHandler) ->
      new @service(project: attrs).$save ((project) -> successHandler(project)), @errorHandler

    delete: (project) ->
      new @service().$delete {id: project.id}, (-> null), @errorHandler

    update: (project, attrs) ->
      new @service(project: attrs).$update {id: project.id}, (-> null), @errorHandler

    all: ->
      @service.query((-> null), @errorHandler)

    find: (id, successHandler) ->
      @service.get(id: id, ((project)->
        successHandler?(project)
        project),
       @errorHandler)


