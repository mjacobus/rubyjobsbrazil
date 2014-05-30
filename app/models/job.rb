class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  validates :user, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :how_to_apply, presence: true

  default_scope ->{ order('created_at DESC') }
  scope :open, ->{ where(open: true) }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
