# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_and_belongs_to_many :tags

  validates :user, presence: true
  validates :city, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :how_to_apply, presence: true

  default_scope -> { order('recruiter_jobs.created_at DESC') }
  scope :open, -> { where(open: true) }

  def to_param
    "#{id}-#{title.parameterize}"
  end

  # form helper
  attr_writer :state_id

  # form helper
  def state_id
    if @state_id.present?
      @state_id.to_i
    elsif city.present?
      city.state_id
    end
  end
end
