# encoding: utf-8
module Kaltura
  module Service

    # Entry Distribution service
    #
    class EntryDistributionService < BaseService

      def add(entry_distribution)
        kparams = {}
        client.add_param(kparams, 'entryDistribution', entry_distribution);
        perform_request('contentdistribution_entrydistribution','add',kparams,false)
      end

      def get(id)
        kparams = {}
        client.add_param(kparams, 'id', id);
        perform_request('contentdistribution_entrydistribution','get',kparams,false)
      end

      def validate(id)
        kparams = {}
        client.add_param(kparams, 'id', id);
        perform_request('contentdistribution_entrydistribution','validate',kparams,false)
      end

      def update(id, entry_distribution)
        kparams = {}
        client.add_param(kparams, 'id', id);
        client.add_param(kparams, 'entryDistribution', entry_distribution);
        perform_request('contentdistribution_entrydistribution','update',kparams,false)
      end

      def delete(id)
        kparams = {}
        client.add_param(kparams, 'id', id);
        perform_request('contentdistribution_entrydistribution','delete',kparams,false)
      end

      def list(filter=nil, pager=nil)
        kparams = {}
        client.add_param(kparams, 'filter', filter);
        client.add_param(kparams, 'pager', pager);
        perform_request('contentdistribution_entrydistribution','list',kparams,false)
      end

      def submit_add(id, submit_when_ready=false)
        kparams = {}
        client.add_param(kparams, 'id', id);
        client.add_param(kparams, 'submitWhenReady', submit_when_ready);
        perform_request('contentdistribution_entrydistribution','submitAdd',kparams,false)
      end

      def submit_update(id)
        kparams = {}
        client.add_param(kparams, 'id', id);
        perform_request('contentdistribution_entrydistribution','submitUpdate',kparams,false)
      end

      def submit_fetch_report(id)
        kparams = {}
        client.add_param(kparams, 'id', id);
        perform_request('contentdistribution_entrydistribution','submitFetchReport',kparams,false)
      end

      def submit_delete(id)
        kparams = {}
        client.add_param(kparams, 'id', id);
        perform_request('contentdistribution_entrydistribution','submitDelete',kparams,false)
      end

      def retry_submit(id)
        kparams = {}
        client.add_param(kparams, 'id', id);
        perform_request('contentdistribution_entrydistribution','retrySubmit',kparams,false)
      end

      def serve_sent_data(id, distribution_action)
        kparams = {}
        client.add_param(kparams, 'id', id);
        client.add_param(kparams, 'actionType', distribution_action);
        perform_request('contentdistribution_entrydistribution','servesentdata',kparams,false)

      end

      def serve_returned_data(id, distribution_action)
        kparams = {}
        client.add_param(kparams, 'id', id);
        client.add_param(kparams, 'actionType', distribution_action);
        perform_request('contentdistribution_entrydistribution','servereturneddata',kparams,false)
      end

    end

  end
end
