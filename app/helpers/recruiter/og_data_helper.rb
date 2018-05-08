module Recruiter
  module OgDataHelper
    def og_data(key, value = nil)
      @og_data ||= {}
      @og_data[key] = value if value
      @og_data[key]
    end
  end
end
