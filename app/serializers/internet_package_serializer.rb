class InternetPackageSerializer < ActiveModel::Serializer
  attributes :id, :plan, :price, :upload_speed, :download_speed
  has_many :users, serializer: UserSerializer
end
