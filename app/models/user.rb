class User < ApplicationRecord
  belongs_to :famille, optional: true
  has_many :idees
end
