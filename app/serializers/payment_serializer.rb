class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :payed_date, :months
end
