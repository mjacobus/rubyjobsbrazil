class Tag < ActiveRecord::Base
  has_and_belongs_to_many :jobs
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
