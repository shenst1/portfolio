angular.module('portfolioApp').factory 'Project', ["$resource", ($resource) ->
  $resource("/projects/:id", {id: "@id"}, {update: {method: "PUT"}})
]
