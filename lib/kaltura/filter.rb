require 'kaltura/filter/base_filter'

require 'kaltura/filter/access_control_filter'
require 'kaltura/filter/base_entry_filter'
require 'kaltura/filter/category_filter'
require 'kaltura/filter/conversion_profile_filter'
require 'kaltura/filter/flavor_params_filter'
require 'kaltura/filter/playable_entry_filter'
require 'kaltura/filter/media_entry_filter'
require 'kaltura/filter/media_entry_filter_for_playlist'
require 'kaltura/filter/report_input_filter'
require 'kaltura/filter/ui_conf_filter'
require 'kaltura/filter/user_filter'
require 'kaltura/filter/widget_filter'
require 'kaltura/filter/partner_filter'
require 'kaltura/filter/system_partner_usage_filter'
require 'kaltura/filter/file_sync_filter'
require 'kaltura/filter/flavor_params_output_filter'
require 'kaltura/filter/base_job_filter'
require 'kaltura/filter/batch_job_filter'
require 'kaltura/filter/control_panel_command_filter'
require 'kaltura/filter/document_entry_filter'
require 'kaltura/filter/distribution_provider_base_filter'
require 'kaltura/filter/distribution_provider_filter'


module Kaltura
  module Filter

  	class DataEntryFilter < BaseEntryFilter
  	end

  	class LiveStreamEntryFilter < MediaEntryFilter
  	end

  	class MixEntryFilter < PlayableEntryFilter
  	end

  	class PlaylistFilter < BaseEntryFilter
  	end

  	class BaseSyndicationFeedFilter < BaseFilter
  	end

  	class SystemUserFilter < BaseFilter
  	end

  	class MediaInfoFilter < BaseFilter
  		attr_accessor :flavor_asset_id_equal
  	end

  	class BatchJobFilterExt < BatchJobFilter
  		attr_accessor :job_type_and_sub_type_in
  	end

  	class GoogleVideoSyndicationFeedFilter < BaseSyndicationFeedFilter
  	end

  	class ITunesSyndicationFeedFilter < BaseSyndicationFeedFilter
  	end

  	class LiveStreamAdminEntryFilter < LiveStreamEntryFilter
  	end

  	class MailJobFilter < BaseJobFilter
  	end

  	class NotificationFilter < BaseJobFilter
  	end

  	class TubeMogulSyndicationFeedFilter < BaseSyndicationFeedFilter
  	end

  	class YahooSyndicationFeedFilter < BaseSyndicationFeedFilter
  	end
  end #module Filter
end #module Kaltura
