# Kaltura::Service::DistributionProviderService
module Kaltura
  module Service

    class DistributionProviderService < BaseService
      def list
        kparams = {}
        perform_request('','list',kparams,false)
      end
    end

  end
end
