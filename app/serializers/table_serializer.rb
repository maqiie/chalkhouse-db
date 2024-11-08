class TableSerializer < ActiveModel::Serializer
  attributes :id, :name, :type, :is_available  # Add any other relevant attributes
end
