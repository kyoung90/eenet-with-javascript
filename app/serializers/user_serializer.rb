class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username
  has_many :payments
  has_many :service_periods
  has_many :internet_status_changes
end
