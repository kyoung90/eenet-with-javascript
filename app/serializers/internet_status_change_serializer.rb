class InternetStatusChangeSerializer < ActiveModel::Serializer
  attributes :id, :active, :comment, :created_at, :updated_at
end
