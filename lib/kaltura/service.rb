require 'kaltura/service/base_service'

require 'kaltura/service/access_control_service'
require 'kaltura/service/admin_user_service'
require 'kaltura/service/base_entry_service'
require 'kaltura/service/bulk_upload_service'
require 'kaltura/service/category_service'
require 'kaltura/service/conversion_profile_service'
require 'kaltura/service/data_service'
require 'kaltura/service/email_ingestion_profile_service'
require 'kaltura/service/flavor_asset_service'
require 'kaltura/service/flavor_params_service'
require 'kaltura/service/live_stream_service'
require 'kaltura/service/media_service'
require 'kaltura/service/mixing_service'
require 'kaltura/service/notification_service'
require 'kaltura/service/partner_service'
require 'kaltura/service/playlist_service'
require 'kaltura/service/report_service'
require 'kaltura/service/search_service'
require 'kaltura/service/session_service'
require 'kaltura/service/stats_service'
require 'kaltura/service/syndication_feed_service'
require 'kaltura/service/system_service'
require 'kaltura/service/ui_conf_service'
require 'kaltura/service/upload_service'
require 'kaltura/service/user_service'
require 'kaltura/service/widget_service'
require 'kaltura/service/x_internal_service'
require 'kaltura/service/system_user_service'
require 'kaltura/service/system_partner_service'

require 'kaltura/service/distribution_profile_service'
require 'kaltura/service/distribution_provider_service'
require 'kaltura/service/entry_distribution_service'

module Kaltura
  ##
  # The service module provides instance methods to the Kaltura::Client class.  This is the bulk of API actions.
  ##
  module Service

    ##
    # FileSyncService is a system user service.
    #
    # @example List up to 100 file sync objects with an error status:
    #    client = Kaltura::Client.new
    #    filter = Kaltura::Filter::FileSyncFilter.new
    #    filter.status_equal = Kaltura::Constants::FileSync::Status::ERROR
    #    pager = Kaltura::FilterPager.new
    #    pager.page_size = 100
    #    client.file_sync_service.list(filter,pager)
    #
    ##
  	class FileSyncService < BaseService

      ##
      # Lists file sync objects by a filter and a pager.
      #
      # @param [Kaltura::Filter::FileSyncFilter] filter The filter to apply to the list.
      # @param [Kaltura::FilterPager] pager The default pager to apply to large lists.
      #
      # @return [Kaltura::Response::FileSyncListResponse] FileSyncListResponse is equivalent to Kaltura::Response::BaseResponse
      #
      # @raise [Kaltura::APIError] raises default Kaltura errors.
      ##
  		def list(filter=nil, pager=nil)
  			kparams = {}
  			client.add_param(kparams, 'filter', filter)
  			client.add_param(kparams, 'pager', pager)
  			perform_request('fileSync','list',kparams,false)
  		end
  	end #class FileSyncService

  	##
  	# FlavorParamsOutputService is not documented by Kaltura.  Probably best to not play with this.
  	# This is likely just used internally by the KMC.
  	##
  	class FlavorParamsOutputService < BaseService

      ##
      # Lists file sync objects by a filter and a pager.
      #
      # @param [Kaltura::Filter::FlavorParamsOutputFilter] filter The filter to apply to the list action.
      # @param [Kaltura::FilterPager] pager The default pager to apply to large lists.
      #
      # @return [Kaltura::Response::FlavorParamsOutputListResponse] This is equivalent to the BaseResponse class.
      #
      # @raise [Kaltura::APIError] raises default Kaltura errors.
      ##
  		def list(filter=nil, pager=nil)
  			kparams = {}
  			client.add_param(kparams, 'filter', filter)
  			client.add_param(kparams, 'pager', pager)
  			perform_request('flavorParamsOutput','list',kparams,false)
  		end
  	end #class FlavorParamsOutputService

  	##
  	# MediaInfoService is not documented by Kaltura.  Probably best to not play with this.
  	# This is likely just used internally by the KMC.
  	##
  	class MediaInfoService < BaseService
      ##
      # Lists media info objects by a filter and a pager.
      #
      # @param [Kaltura::Filter::MediaInfoFilter] filter The filter to apply to the list action.
      # @param [Kaltura::FilterPager] pager The default pager to apply to large lists.
      #
      # @return [Kaltura::Response::MediaInfoListResponse] This is equivalent to the BaseResponse class.
      #
      # @raise [Kaltura::APIError] raises default Kaltura errors.
      ##
  		def list(filter=nil, pager=nil)
  			kparams = {}
  			client.add_param(kparams, 'filter', filter)
  			client.add_param(kparams, 'pager', pager)
  			perform_request('mediaInfo','list',kparams,false)
  		end
  	end #class MediaInfoService

  	##
  	# EntryAdminService is not documented by Kaltura.  Probably best not to play with this.
  	# This is likely just used internally by the KMC.
  	##
  	class EntryAdminService < BaseService

      ##
      # Gets an EntryAdmin object by entry_id.
      #
      # @param [String] entry_id Media entry id
      # @param [Integer] version Desired version of the data.
      #
      # @return [Object] Not entirely sure what this returns.
      #
      # @raise [Kaltura::APIError] Raises default Kaltura errors.
      ##
  		def get(entry_id, version=-1)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'version', version)
  			perform_request('entryAdmin','get',kparams,false)
  		end
  	end #class EntryAdminService
  end #module Service
end #module Kaltura
