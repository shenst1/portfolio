class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :about, :url, :tools, :feedback
end
