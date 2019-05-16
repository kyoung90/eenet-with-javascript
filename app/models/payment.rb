class Payment < ApplicationRecord
    belongs_to :internet_package
    belongs_to :user

    validates :months, presence: true
end
