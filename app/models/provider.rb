class Provider < ApplicationRecord
  has_and_belongs_to_many :states
end
