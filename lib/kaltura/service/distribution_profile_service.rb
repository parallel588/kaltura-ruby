module Kaltura
  module Service
    class DistributionProfileService < BaseService
      def list(filter = nil, pager = nil)
        kparams = {}
        client.add_param(kparams, 'filter', filter)
  			client.add_param(kparams, 'pager', pager)
        perform_request('contentdistribution_distributionprofile','list',kparams,false)
      end

    end

  end
end
