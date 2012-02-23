# encoding: utf-8
module Kaltura
  module Service
    class DistributionProfileService < BaseService

      # List all distribution providers
      #
      def list(filter = nil, pager = nil)
        kparams = {}
        client.add_param(kparams, 'filter', filter)
        client.add_param(kparams, 'pager', pager)
        perform_request('contentdistribution_distributionprofile','list',kparams,false)
      end

      # Add new Distribution Profile
      #
      def add(distribution_profile)
        kparams = {}
        client.add_param(kparams, 'distributionProfile', distribution_profile)
        perform_request('contentdistribution_distributionprofile','add',kparams,false)
      end

      #	Get Distribution Profile by id
      #
      def get(distribution_profile_id)
        kparams = {}
        client.add_param(kparams, 'id', distribution_profile_id)
        perform_request('contentdistribution_distributionprofile', 'get', kparams, false)
      end

      # Update Distribution Profile by id
      #
      def update(distribution_profile_id, distribution_profile)
        kparams = {}
        client.add_param(kparams, 'id', distribution_profile_id)
        client.add_param(kparams, 'distributionProfile', distribution_profile)
        perform_request('contentdistribution_distributionprofile', 'update', kparams, false)
      end

      # Update Distribution Profile status by id
      #
      def update_status(distribution_profile_id, distribution_profile_status)
        kparams = {}
        client.add_param(kparams, 'id', distribution_profile_id)
        client.add_param(kparams, 'status', distribution_profile_status)
        perform_request('contentdistribution_distributionprofile', 'updatestatus', kparams, false)
      end

      # Delete Distribution Profile by id
      #
      def delete(distribution_profile_id)
        kparams = {}
        client.add_param(kparams, 'id', distribution_profile_id)
        perform_request('contentdistribution_distributionprofile', 'delete', kparams, false)
      end

    end

  end
end
