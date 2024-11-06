# app/serializers/table_serializer.rb
class TableSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :is_available
end
