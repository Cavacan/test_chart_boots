class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :step_records
end
