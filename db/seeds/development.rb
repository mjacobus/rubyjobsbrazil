require 'machinist'
require Rails.root.join('spec/support/blueprints.rb')

module RandomRecords
  extend ActiveSupport::Concern

  module ClassMethods
    def random
      order('RAND()').first
    end
  end
end

ActiveRecord::Base.send(:include, RandomRecords)

30.times do
  job = Job.make!(city: City.random)

  begin
    job.tags << Tag.random
    job.tags << Tag.random
  rescue ActiveRecord::RecordNotUnique => e
  end
end

