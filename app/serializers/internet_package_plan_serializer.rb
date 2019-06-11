class InternetPackagePlanSerializer < ActiveModel::Serializer
  attributes :id, :plan, :price, :upload_speed, :download_speed
end
