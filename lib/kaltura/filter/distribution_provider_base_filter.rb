module Kaltura
  module Filter
    class DistributionProviderBaseFilter < BaseFilter
      attr_accessor :type_equal #KalturaDistributionProviderType
      attr_accessor :type_in
    end
  end
end
