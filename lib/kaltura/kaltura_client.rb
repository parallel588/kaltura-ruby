
module Kaltura
  class DistributionFieldConfig < ObjectBase
    attr_accessor :entry_mrss_xslt #	string	V	An XSLT string that extracts the right value from the Kaltura entry MRSS XML.
    # The value of the current connector field will be the one that is returned from transforming
    # the Kaltura entry MRSS XML using this XSLT string.
    attr_accessor :field_name #	string	V	A value taken from a connector field enum which associates the current configuration to that connector field
    #     Field enum class should be returned by the provider's getFieldEnumClass function.
		attr_accessor :is_default #	bool		Is this field config is the default for the distribution provider?
		attr_accessor :is_required #	KalturaDistributionFieldRequiredStatus	V	Is the field required to have a value for submission ?
		attr_accessor :update_on_change #	bool	V	Trigger distribution update when this field changes or not ?
		attr_accessor :update_params #	KalturaStringArray	V	Entry column or metadata xpath that should trigger an update
    # TODO: find a better solution for this
		attr_accessor :user_friendly_field_name #	string	V	A string that will be shown to the user as the field name in error messages related to the current field
  end
  class DistributionProfile < ObjectBase
		attr_accessor :auto_create_flavors #	string	V	Comma separated flavor params ids that should be auto converted
		attr_accessor :auto_create_thumb #	string	V	Comma separated thumbnail params ids that should be auto generated
		attr_accessor :created_at #	int		Profile creation date as Unix timestamp (In seconds)
		attr_accessor :delete_enabled	#KalturaDistributionProfileActionStatus	V
		attr_accessor :id	#int		Auto generated unique id
		attr_accessor :name	#string	V
		attr_accessor :optional_flavor_params_ids	#string	V	Comma separated flavor params ids that should be submitted if ready
		attr_accessor :optional_thumb_dimensions	#KalturaDistributionThumbDimensionsArray	V	Thumbnail dimensions that should be submitted if ready
		attr_accessor :partner_id	#int
		attr_accessor :provider_type	#KalturaDistributionProviderType	V
		attr_accessor :report_enabled	#KalturaDistributionProfileActionStatus	V
		attr_accessor :required_flavor_params_ids	#string	V	Comma separated flavor params ids that required to be readt before submission
		attr_accessor :required_thumb_dimensions	#KalturaDistributionThumbDimensionsArray	V	Thumbnail dimensions that required to be readt before submission
		attr_accessor :status	#KalturaDistributionProfileStatus	V
		attr_accessor :submit_enabled	#KalturaDistributionProfileActionStatus	V
		attr_accessor :sunrise_default_offset	#int	V	If entry distribution sunrise not specified that will be the default since entry creation time, in seconds
		attr_accessor :sunset_default_offset	#int	V	If entry distribution sunset not specified that will be the default since entry creation time, in seconds
		attr_accessor :update_enabled	#KalturaDistributionProfileActionStatus	V
		attr_accessor :updated_at	#int		Profile last update date as Unix timestamp (In seconds)

  end
  class ConfigurableDistributionProfile < DistributionProfile
  end
  class ExampleDistributionProfile < DistributionProfile
  end
  class FreewheelDistributionProfile < DistributionProfile
  end
  class GenericDistributionProfile < DistributionProfile
  end
  class PodcastDistributionProfile < DistributionProfile
  end
  class SyndicationDistributionProfile < DistributionProfile
  end
  class YoutubeApiDistributionProfile < ConfigurableDistributionProfile
    attr_accessor :allowComments
		attr_accessor :allowEmbedding
		attr_accessor :allowRatings
		attr_accessor :allowResponses
		attr_accessor :defaultCategor
		attr_accessor :password
		attr_accessor :username
  end
  class DistributionProvider < ObjectBase
		attr_accessor :type # type	KalturaDistributionProviderType
    attr_accessor :availability_update_enabled #	bool
    attr_accessor :delete_instead_update #	bool
    attr_accessor :interval_before_sunrise#	int
    attr_accessor :interval_before_sunset#	int
    attr_accessor :name #	string
    attr_accessor :schedule_update_enabled #	bool

    attr_accessor :update_required_entry_fields #	string
    attr_accessor :update_required_metadata_xpaths #	string

  end
  class GenericDistributionProvider < DistributionProvider
    # availability_update_enabled=
    attr_accessor :created_at	#int		Generic distribution provider creation date as Unix timestamp (In seconds)
    attr_accessor :editable_fields#	string	V
    attr_accessor :id#	int		Auto generated
    attr_accessor :is_default#	bool	V
    attr_accessor :mandatory_fields#	string	V
    attr_accessor :optional_flavor_params_ids#	string	V
    attr_accessor :optional_thumb_dimensions#	Kaltura DistributionThumbDimensionsArray	V
    attr_accessor :partner_id#	int
    attr_accessor :required_flavor_params_ids#	string	V
    attr_accessor :required_thumb_dimensions#	Kaltura DistributionThumbDimensionsArray	V
    attr_accessor :status #	Kaltura GenericDistributionProviderStatus
    attr_accessor :updated_at#	int
  end
  class DistributionProviderType < ObjectBase
  end

  class SyndicationDistributionProvider < DistributionProvider
  end
  class MsnDistributionProvider < DistributionProvider
  end
  class YouTubeDistributionProvider < DistributionProvider
  end
  class YoutubeApiDistributionProvider < DistributionProvider
  end
  class DailymotionDistributionProvider < DistributionProvider
  end
  class PodcastDistributionProvider < DistributionProvider
  end
  class TVComDistributionProvider < DistributionProvider
  end
  class FreewheelDistributionProvider < DistributionProvider
  end
  class FreewheelGenericDistributionProvider < DistributionProvider
  end
  class HuluDistributionProvider < DistributionProvider
  end
  class DoubleClickDistributionProvider < DistributionProvider
  end
  class SynacorHboDistributionProvider < DistributionProvider
  end
  class AvnDistributionProvider < DistributionProvider
  end
  class ComcastMrssDistributionProvider < DistributionProvider
  end
  class IdeticDistributionProvider < DistributionProvider
  end
  class TimeWarnerDistributionProvider < DistributionProvider
  end
  class YahooDistributionProvider < DistributionProvider
  end
  class NdnDistributionProvider < DistributionProvider
  end
  class UverseDistributionProvider < DistributionProvider
  end
  class VerizonVcastDistributionProvider < DistributionProvider
  end
  class QuickPlayDistributionProvider < DistributionProvider
  end




	class BaseRestriction < ObjectBase

	end
	class AccessControl < ObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :created_at
		attr_accessor :is_default
		attr_accessor :restrictions

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def is_default=(val)
			@is_default = val.to_i
		end
	end


	class FilterPager < ObjectBase
		attr_accessor :page_size
		attr_accessor :page_index

		def page_size=(val)
			@page_size = val.to_i
		end
		def page_index=(val)
			@page_index = val.to_i
		end
	end

	class AdminUser < ObjectBase
		attr_accessor :password
		attr_accessor :email
		attr_accessor :screen_name

	end

	class BaseEntry < ObjectBase
		attr_accessor :id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :partner_id
		attr_accessor :user_id
		attr_accessor :tags
		attr_accessor :admin_tags
		attr_accessor :categories
		attr_accessor :categories_ids
		attr_accessor :status
		attr_accessor :moderation_status
		attr_accessor :moderation_count
		attr_accessor :type
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :rank
		attr_accessor :total_rank
		attr_accessor :votes
		attr_accessor :group_id
		attr_accessor :partner_data
		attr_accessor :download_url
		attr_accessor :search_text
		attr_accessor :license_type
		attr_accessor :version
		attr_accessor :thumbnail_url
		attr_accessor :access_control_id
		attr_accessor :start_date
		attr_accessor :end_date
		attr_accessor :reference_id
		attr_accessor :replacing_entry_id
		attr_accessor :replaced_entry_id
		attr_accessor :replacement_status
		attr_accessor :partner_sort_value
		attr_accessor :conversion_profile_id
    attr_accessor :root_entry_id
    attr_accessor :operation_attributes


		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def moderation_status=(val)
			@moderation_status = val.to_i
		end
		def moderation_count=(val)
			@moderation_count = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
		  @updated_at = val.to_i
	  end
		def rank=(val)
			@rank = val.to_f
		end
		def total_rank=(val)
			@total_rank = val.to_i
		end
		def votes=(val)
			@votes = val.to_i
		end
		def group_id=(val)
			@group_id = val.to_i
		end
		def license_type=(val)
			@license_type = val.to_i
		end
		def version=(val)
			@version = val.to_i
		end
		def access_control_id=(val)
			@access_control_id = val.to_i
		end
		def start_date=(val)
			@start_date = val.to_i
		end
		def end_date=(val)
			@end_date = val.to_i
		end
		def categories_ids=(val)
		  @categories_ids = val.to_i
	  end

	  def reference_at=(val)
      @reference_id = val.to_i
    end

    def replacing_entry_id=(val)
      @replacing_entry_id = val.to_i
    end

    def replaced_entry_id=(val)
      @replaced_entry_id = val.to_i
    end

    def replacement_status=(val)
      @replacement_status = val.to_i
    end

    def partner_sort_value=(val)
      @partner_sort_value = val.to_i
    end

    def conversion_profile_id=(val)
      @conversion_profile_id = val.to_i
    end

    def root_entry_id=(val)
      @root_entry_id = val.to_i
    end

    def operation_attributes=(val)
      @operation_attributes = val.to_i
    end
	end

	class ModerationFlag < ObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :user_id
		attr_accessor :moderation_object_type
		attr_accessor :flagged_entry_id
		attr_accessor :flagged_user_id
		attr_accessor :status
		attr_accessor :comments
		attr_accessor :flag_type
		attr_accessor :created_at
		attr_accessor :updated_at

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def moderation_object_type=(val)
			@moderation_object_type = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def flag_type=(val)
			@flag_type = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
	end

	class EntryContextDataParams < ObjectBase
		attr_accessor :referrer

	end

	class EntryContextDataResult < ObjectBase
		attr_accessor :is_site_restricted
		attr_accessor :is_country_restricted
		attr_accessor :is_session_restricted
		attr_accessor :preview_length
		attr_accessor :is_scheduled_now
		attr_accessor :is_admin

		def is_site_restricted=(val)
			@is_site_restricted = to_b(val)
		end
		def is_country_restricted=(val)
			@is_country_restricted = to_b(val)
		end
		def is_session_restricted=(val)
			@is_session_restricted = to_b(val)
		end
		def preview_length=(val)
			@preview_length = val.to_i
		end
		def is_scheduled_now=(val)
			@is_scheduled_now = to_b(val)
		end
		def is_admin=(val)
			@is_admin = to_b(val)
		end
	end

	class BulkUploadResult < ObjectBase
		attr_accessor :id
		attr_accessor :bulk_upload_job_id
		attr_accessor :line_index
		attr_accessor :partner_id
		attr_accessor :entry_id
		attr_accessor :entry_status
		attr_accessor :row_data
		attr_accessor :title
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :url
		attr_accessor :content_type
		attr_accessor :conversion_profile_id
		attr_accessor :access_control_profile_id
		attr_accessor :category
		attr_accessor :schedule_start_date
		attr_accessor :schedule_end_date
		attr_accessor :thumbnail_url
		attr_accessor :thumbnail_saved
		attr_accessor :partner_data
		attr_accessor :error_description

		def id=(val)
			@id = val.to_i
		end
		def bulk_upload_job_id=(val)
			@bulk_upload_job_id = val.to_i
		end
		def line_index=(val)
			@line_index = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def entry_status=(val)
			@entry_status = val.to_i
		end
		def conversion_profile_id=(val)
			@conversion_profile_id = val.to_i
		end
		def access_control_profile_id=(val)
			@access_control_profile_id = val.to_i
		end
		def schedule_start_date=(val)
			@schedule_start_date = val.to_i
		end
		def schedule_end_date=(val)
			@schedule_end_date = val.to_i
		end
		def thumbnail_saved=(val)
			@thumbnail_saved = to_b(val)
		end
	end

	class BulkUpload < ObjectBase
		attr_accessor :id
		attr_accessor :uploaded_by
		attr_accessor :uploaded_on
		attr_accessor :num_of_entries
		attr_accessor :status
		attr_accessor :log_file_url
		attr_accessor :csv_file_url
		attr_accessor :results

		def id=(val)
			@id = val.to_i
		end
		def uploaded_on=(val)
			@uploaded_on = val.to_i
		end
		def num_of_entries=(val)
			@num_of_entries = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
	end

	class Category < ObjectBase
		attr_accessor :id
		attr_accessor :parent_id
		attr_accessor :depth
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :full_name
		attr_accessor :entries_count
		attr_accessor :created_at

		def id=(val)
			@id = val.to_i
		end
		def parent_id=(val)
			@parent_id = val.to_i
		end
		def depth=(val)
			@depth = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def entries_count=(val)
			@entries_count = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
	end

	class CropDimensions < ObjectBase
		attr_accessor :left
		attr_accessor :top
		attr_accessor :width
		attr_accessor :height

		def left=(val)
			@left = val.to_i
		end
		def top=(val)
			@top = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
	end

	class ConversionProfile < ObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :created_at
		attr_accessor :flavor_params_ids
		attr_accessor :is_default
		attr_accessor :crop_dimensions
		attr_accessor :clip_start
		attr_accessor :clip_duration

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def is_default=(val)
			@is_default = val.to_i
		end
		def clip_start=(val)
			@clip_start = val.to_i
		end
		def clip_duration=(val)
			@clip_duration = val.to_i
		end
	end

	class DataEntry < BaseEntry
		attr_accessor :data_content

	end

	class EmailIngestionProfile < ObjectBase
		attr_accessor :id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :email_address
		attr_accessor :mailbox_id
		attr_accessor :partner_id
		attr_accessor :conversion_profile2id
		attr_accessor :moderation_status
		attr_accessor :status
		attr_accessor :created_at
		attr_accessor :default_category
		attr_accessor :default_user_id
		attr_accessor :default_tags
		attr_accessor :default_admin_tags

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def conversion_profile2id=(val)
			@conversion_profile2id = val.to_i
		end
		def moderation_status=(val)
			@moderation_status = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
	end

	class PlayableEntry < BaseEntry
		attr_accessor :plays
		attr_accessor :views
		attr_accessor :width
		attr_accessor :height
		attr_accessor :duration
		attr_accessor :ms_duration
		attr_accessor :duration_type

		def plays=(val)
			@plays = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def ms_duration=(val)
			@ms_duration = val.to_i
		end
	end

	class MediaEntry < PlayableEntry
		attr_accessor :media_type
		attr_accessor :conversion_quality
		attr_accessor :source_type
		attr_accessor :search_provider_type
		attr_accessor :search_provider_id
		attr_accessor :credit_user_name
		attr_accessor :credit_url
		attr_accessor :media_date
		attr_accessor :data_url
		attr_accessor :flavor_params_ids

		def media_type=(val)
			@media_type = val.to_i
		end
		def source_type=(val)
			@source_type = val.to_i
		end
		def search_provider_type=(val)
			@search_provider_type = val.to_i
		end
		def media_date=(val)
			@media_date = val.to_i
		end
	end

	class FlavorAsset < ObjectBase
		attr_accessor :id
		attr_accessor :entry_id
		attr_accessor :partner_id
		attr_accessor :status
		attr_accessor :flavor_params_id
		attr_accessor :version
		attr_accessor :width
		attr_accessor :height
		attr_accessor :bitrate
		attr_accessor :frame_rate
		attr_accessor :size
		attr_accessor :is_original
		attr_accessor :tags
		attr_accessor :is_web
		attr_accessor :file_ext
		attr_accessor :container_format
		attr_accessor :video_codec_id
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :deleted_at
		attr_accessor :description
    attr_accessor :partner_data
    attr_accessor :partner_description

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def flavor_params_id=(val)
			@flavor_params_id = val.to_i
		end
		def version=(val)
			@version = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def bitrate=(val)
			@bitrate = val.to_i
		end
		def frame_rate=(val)
			@frame_rate = val.to_i
		end
		def size=(val)
			@size = val.to_i
		end
		def is_original=(val)
			@is_original = to_b(val)
		end
		def is_web=(val)
			@is_web = to_b(val)
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def deleted_at=(val)
			@deleted_at = val.to_i
		end
    def partner_data=(val)
      @partner_data = val.to_i
    end
    def partner_description=(val)
      @partner_description = val.to_i
    end
	end

	class FlavorParams < ObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :created_at
		attr_accessor :is_system_default
		attr_accessor :tags
		attr_accessor :format
		attr_accessor :video_codec
		attr_accessor :video_bitrate
		attr_accessor :audio_codec
		attr_accessor :audio_bitrate
		attr_accessor :audio_channels
		attr_accessor :audio_sample_rate
		attr_accessor :width
		attr_accessor :height
		attr_accessor :frame_rate
		attr_accessor :gop_size
		attr_accessor :conversion_engines
		attr_accessor :conversion_engines_extra_params
		attr_accessor :two_pass
		attr_accessor :deinterlice
		attr_accessor :rotate
		attr_accessor :operators
		attr_accessor :engine_version
    attr_accessor :partner_data
    attr_accessor :partner_description

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def is_system_default=(val)
			@is_system_default = val.to_i
		end
		def video_bitrate=(val)
			@video_bitrate = val.to_i
		end
		def audio_bitrate=(val)
			@audio_bitrate = val.to_i
		end
		def audio_channels=(val)
			@audio_channels = val.to_i
		end
		def audio_sample_rate=(val)
			@audio_sample_rate = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def frame_rate=(val)
			@frame_rate = val.to_i
		end
		def gop_size=(val)
			@gop_size = val.to_i
		end
		def two_pass=(val)
			@two_pass = to_b(val)
		end
		def deinterlice=(val)
		  @deinterlice = val.to_i
	  end
	  def rotate=(val)
	    @rotate = val.to_i
    end
    def operators=(val)
      @operators = val.to_s
    end
    def engine_version=(val)
      @engine_version = val.to_i
    end
    def partner_data=(val)
      @partner_data= val.to_i
    end
    def partner_description=(val)
      @partner_description = val.to_i
    end
	end

	class FlavorAssetWithParams < ObjectBase
		attr_accessor :flavor_asset
		attr_accessor :flavor_params
		attr_accessor :entry_id

	end

	class LiveStreamBitrate < ObjectBase
		attr_accessor :bitrate
		attr_accessor :width
		attr_accessor :height

		def bitrate=(val)
			@bitrate = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
	end

	class LiveStreamEntry < MediaEntry
		attr_accessor :offline_message
		attr_accessor :stream_remote_id
		attr_accessor :stream_remote_backup_id
		attr_accessor :bitrates

	end

  ##
  # The LiveStreamAdminEntry object is what the LiveStreamService utilizes to create streams.
  #
  # It is important to note that the fields media_type, and the encoding fields are necessary
  # to create a LiveStream on the Kaltura server.
  ##
	class LiveStreamAdminEntry < LiveStreamEntry
	  # This field is required to create a new LiveStream on the Kaltura server.
		attr_accessor :encoding_ip1
		# This field is required to create a new LiveStream on the Kaltura server.
		attr_accessor :encoding_ip2
		attr_accessor :stream_password
		attr_accessor :stream_username

    ##
    # The camelcase method needed to be overriden for LiveStreamAdminEntry due
    # to the fact that the encoding_ip fields do not fit the camel case setup.
    ##
    def camelcase(val)
      case val
        when 'encoding_ip1'
          'encodingIP1'
        when 'encoding_ip2'
          'encodingIP2'
      else
        super(val)
      end
    end

	end

	class Search < ObjectBase
		attr_accessor :key_words
		attr_accessor :search_source
		attr_accessor :media_type
		attr_accessor :extra_data
		attr_accessor :auth_data

		def search_source=(val)
			@search_source = val.to_i
		end
		def media_type=(val)
			@media_type = val.to_i
		end
	end

	class SearchResult < Search
		attr_accessor :id
		attr_accessor :title
		attr_accessor :thumb_url
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :url
		attr_accessor :source_link
		attr_accessor :credit
		attr_accessor :license_type
		attr_accessor :flash_playback_type

		def license_type=(val)
			@license_type = val.to_i
		end
	end

	class MixEntry < PlayableEntry
		attr_accessor :has_real_thumbnail
		attr_accessor :editor_type
		attr_accessor :data_content

		def has_real_thumbnail=(val)
			@has_real_thumbnail = to_b(val)
		end
		def editor_type=(val)
			@editor_type = val.to_i
		end
	end

	class ClientNotification < ObjectBase
		attr_accessor :url
		attr_accessor :data

	end

	class Partner < ObjectBase
		attr_accessor :id
		attr_accessor :name
		attr_accessor :website
		attr_accessor :notification_url
		attr_accessor :appear_in_search
		attr_accessor :created_at
		attr_accessor :admin_name
		attr_accessor :admin_email
		attr_accessor :description
		attr_accessor :commercial_use
		attr_accessor :landing_page
		attr_accessor :user_landing_page
		attr_accessor :content_categories
		attr_accessor :type
		attr_accessor :phone
		attr_accessor :describe_yourself
		attr_accessor :adult_content
		attr_accessor :def_conversion_profile_type
		attr_accessor :notify
		attr_accessor :status
		attr_accessor :allow_quick_edit
		attr_accessor :merge_entry_lists
		attr_accessor :notifications_config
		attr_accessor :max_upload_size
		attr_accessor :partner_package
		attr_accessor :secret
		attr_accessor :admin_secret
		attr_accessor :cms_password
		attr_accessor :allow_multi_notification

		def id=(val)
			@id = val.to_i
		end
		def appear_in_search=(val)
			@appear_in_search = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def adult_content=(val)
			@adult_content = to_b(val)
		end
		def notify=(val)
			@notify = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def allow_quick_edit=(val)
			@allow_quick_edit = val.to_i
		end
		def merge_entry_lists=(val)
			@merge_entry_lists = val.to_i
		end
		def max_upload_size=(val)
			@max_upload_size = val.to_i
		end
		def partner_package=(val)
			@partner_package = val.to_i
		end
		def allow_multi_notification=(val)
			@allow_multi_notification = val.to_i
		end
	end

	class PartnerUsage < ObjectBase
		attr_accessor :hosting_gb
		attr_accessor :percent
		attr_accessor :package_bw
		attr_accessor :usage_gb
		attr_accessor :reached_limit_date
		attr_accessor :usage_graph

		def hosting_gb=(val)
			@hosting_gb = val.to_f
		end
		def percent=(val)
			@percent = val.to_f
		end
		def package_bw=(val)
			@package_bw = val.to_i
		end
		def usage_gb=(val)
			@usage_gb = val.to_i
		end
		def reached_limit_date=(val)
			@reached_limit_date = val.to_i
		end
	end

	class Playlist < BaseEntry
		attr_accessor :playlist_content
		attr_accessor :filters
		attr_accessor :total_results
		attr_accessor :playlist_type
		attr_accessor :plays
		attr_accessor :views
		attr_accessor :duration

		def total_results=(val)
			@total_results = val.to_i
		end
		def playlist_type=(val)
			@playlist_type = val.to_i
		end
		def plays=(val)
			@plays = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
	end

	class ReportGraph < ObjectBase
		attr_accessor :id
		attr_accessor :data

	end

	class ReportTotal < ObjectBase
		attr_accessor :header
		attr_accessor :data

	end

	class ReportTable < ObjectBase
		attr_accessor :header
		attr_accessor :data
		attr_accessor :total_count

		def total_count=(val)
			@total_count = val.to_i
		end
	end

	class SearchAuthData < ObjectBase
		attr_accessor :auth_data
		attr_accessor :login_url
		attr_accessor :message

	end

	class StatsEvent < ObjectBase
		attr_accessor :client_ver
		attr_accessor :event_type
		attr_accessor :event_timestamp
		attr_accessor :session_id
		attr_accessor :partner_id
		attr_accessor :entry_id
		attr_accessor :unique_viewer
		attr_accessor :widget_id
		attr_accessor :uiconf_id
		attr_accessor :user_id
		attr_accessor :current_point
		attr_accessor :duration
		attr_accessor :user_ip
		attr_accessor :process_duration
		attr_accessor :control_id
		attr_accessor :seek
		attr_accessor :new_point
		attr_accessor :referrer
		attr_accessor :is_first_in_session

		def event_type=(val)
			@event_type = val.to_i
		end
		def event_timestamp=(val)
			@event_timestamp = val.to_f
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def uiconf_id=(val)
			@uiconf_id = val.to_i
		end
		def current_point=(val)
			@current_point = val.to_i
		end
		def duration=(val)
			@duration = val.to_i
		end
		def process_duration=(val)
			@process_duration = val.to_i
		end
		def seek=(val)
			@seek = to_b(val)
		end
		def new_point=(val)
			@new_point = val.to_i
		end
		def is_first_in_session=(val)
			@is_first_in_session = to_b(val)
		end
	end

	class StatsKmcEvent < ObjectBase
		attr_accessor :client_ver
		attr_accessor :kmc_event_action_path
		attr_accessor :kmc_event_type
		attr_accessor :event_timestamp
		attr_accessor :session_id
		attr_accessor :partner_id
		attr_accessor :entry_id
		attr_accessor :widget_id
		attr_accessor :uiconf_id
		attr_accessor :user_id
		attr_accessor :user_ip

		def kmc_event_type=(val)
			@kmc_event_type = val.to_i
		end
		def event_timestamp=(val)
			@event_timestamp = val.to_f
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def uiconf_id=(val)
			@uiconf_id = val.to_i
		end
	end

	class CEError < ObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :browser
		attr_accessor :server_ip
		attr_accessor :server_os
		attr_accessor :php_version
		attr_accessor :ce_admin_email
		attr_accessor :type
		attr_accessor :description
		attr_accessor :data

		def partner_id=(val)
			@partner_id = val.to_i
		end
	end

	class BaseSyndicationFeed < ObjectBase
		attr_accessor :id
		attr_accessor :feed_url
		attr_accessor :partner_id
		attr_accessor :playlist_id
		attr_accessor :name
		attr_accessor :status
		attr_accessor :type
		attr_accessor :landing_page
		attr_accessor :created_at
		attr_accessor :allow_embed
		attr_accessor :player_uiconf_id
		attr_accessor :flavor_param_id
		attr_accessor :transcode_existing_content
		attr_accessor :add_to_default_conversion_profile
		attr_accessor :categories

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def type=(val)
			@type = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def allow_embed=(val)
			@allow_embed = to_b(val)
		end
		def player_uiconf_id=(val)
			@player_uiconf_id = val.to_i
		end
		def flavor_param_id=(val)
			@flavor_param_id = val.to_i
		end
		def transcode_existing_content=(val)
			@transcode_existing_content = to_b(val)
		end
		def add_to_default_conversion_profile=(val)
			@add_to_default_conversion_profile = to_b(val)
		end
	end

	class SyndicationFeedEntryCount < ObjectBase
		attr_accessor :total_entry_count
		attr_accessor :actual_entry_count
		attr_accessor :require_transcoding_count

		def total_entry_count=(val)
			@total_entry_count = val.to_i
		end
		def actual_entry_count=(val)
			@actual_entry_count = val.to_i
		end
		def require_transcoding_count=(val)
			@require_transcoding_count = val.to_i
		end
	end

	class UiConf < ObjectBase
		attr_accessor :id
		attr_accessor :name
		attr_accessor :description
		attr_accessor :partner_id
		attr_accessor :obj_type
		attr_accessor :obj_type_as_string
		attr_accessor :width
		attr_accessor :height
		attr_accessor :html_params
		attr_accessor :swf_url
		attr_accessor :conf_file_path
		attr_accessor :conf_file
		attr_accessor :conf_file_features
		attr_accessor :conf_vars
		attr_accessor :use_cdn
		attr_accessor :tags
		attr_accessor :swf_url_version
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :creation_mode

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def obj_type=(val)
			@obj_type = val.to_i
		end
		def width=(val)
			@width = val.to_i
		end
		def height=(val)
			@height = val.to_i
		end
		def use_cdn=(val)
			@use_cdn = to_b(val)
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def creation_mode=(val)
			@creation_mode = val.to_i
		end
	end

	class User < ObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :screen_name
		attr_accessor :full_name
		attr_accessor :email
		attr_accessor :date_of_birth
		attr_accessor :country
		attr_accessor :state
		attr_accessor :city
		attr_accessor :zip
		attr_accessor :thumbnail_url
		attr_accessor :description
		attr_accessor :tags
		attr_accessor :admin_tags
		attr_accessor :gender
		attr_accessor :status
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :partner_data
		attr_accessor :indexed_partner_data_int
		attr_accessor :indexed_partner_data_string
		attr_accessor :storage_size

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def date_of_birth=(val)
			@date_of_birth = val.to_i
		end
		def gender=(val)
			@gender = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def indexed_partner_data_int=(val)
			@indexed_partner_data_int = val.to_i
		end
		def storage_size=(val)
			@storage_size = val.to_i
		end
	end

	class Widget < ObjectBase
		attr_accessor :id
		attr_accessor :source_widget_id
		attr_accessor :root_widget_id
		attr_accessor :partner_id
		attr_accessor :entry_id
		attr_accessor :ui_conf_id
		attr_accessor :security_type
		attr_accessor :security_policy
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :partner_data
		attr_accessor :widget_html

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def ui_conf_id=(val)
			@ui_conf_id = val.to_i
		end
		def security_type=(val)
			@security_type = val.to_i
		end
		def security_policy=(val)
			@security_policy = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
	end

	class SystemUser < ObjectBase
		attr_accessor :id
		attr_accessor :email
		attr_accessor :first_name
		attr_accessor :last_name
		attr_accessor :password
		attr_accessor :created_by
		attr_accessor :status
		attr_accessor :is_primary
		attr_accessor :status_updated_at
		attr_accessor :created_at
		attr_accessor :role

		def id=(val)
			@id = val.to_i
		end
		def created_by=(val)
			@created_by = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def is_primary=(val)
			@is_primary = to_b(val)
		end
		def status_updated_at=(val)
			@status_updated_at = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
	end

	class SystemPartnerUsageItem < ObjectBase
		attr_accessor :partner_id
		attr_accessor :partner_name
		attr_accessor :partner_status
		attr_accessor :partner_package
		attr_accessor :partner_created_at
		attr_accessor :views
		attr_accessor :plays
		attr_accessor :entries_count
		attr_accessor :total_entries_count
		attr_accessor :video_entries_count
		attr_accessor :image_entries_count
		attr_accessor :audio_entries_count
		attr_accessor :mix_entries_count
		attr_accessor :bandwidth
		attr_accessor :total_storage
		attr_accessor :storage

		def partner_id=(val)
			@partner_id = val.to_i
		end
		def partner_status=(val)
			@partner_status = val.to_i
		end
		def partner_package=(val)
			@partner_package = val.to_i
		end
		def partner_created_at=(val)
			@partner_created_at = val.to_i
		end
		def views=(val)
			@views = val.to_i
		end
		def plays=(val)
			@plays = val.to_i
		end
		def entries_count=(val)
			@entries_count = val.to_i
		end
		def total_entries_count=(val)
			@total_entries_count = val.to_i
		end
		def video_entries_count=(val)
			@video_entries_count = val.to_i
		end
		def image_entries_count=(val)
			@image_entries_count = val.to_i
		end
		def audio_entries_count=(val)
			@audio_entries_count = val.to_i
		end
		def mix_entries_count=(val)
			@mix_entries_count = val.to_i
		end
		def bandwidth=(val)
			@bandwidth = val.to_f
		end
		def total_storage=(val)
			@total_storage = val.to_f
		end
		def storage=(val)
			@storage = val.to_f
		end
	end

	class SystemPartnerConfiguration < ObjectBase
		attr_accessor :host
		attr_accessor :cdn_host
		attr_accessor :max_bulk_size
		attr_accessor :partner_package

		def max_bulk_size=(val)
			@max_bulk_size = val.to_i
		end
		def partner_package=(val)
			@partner_package = val.to_i
		end
	end

	class SystemPartnerPackage < ObjectBase
		attr_accessor :id
		attr_accessor :name

		def id=(val)
			@id = val.to_i
		end
	end

	class FileSync < ObjectBase
		attr_accessor :id
		attr_accessor :partner_id
		attr_accessor :object_type
		attr_accessor :object_id
		attr_accessor :version
		attr_accessor :object_sub_type
		attr_accessor :dc
		attr_accessor :original
		attr_accessor :created_at
		attr_accessor :updated_at
		attr_accessor :ready_at
		attr_accessor :sync_time
		attr_accessor :status
		attr_accessor :file_type
		attr_accessor :linked_id
		attr_accessor :link_count
		attr_accessor :file_root
		attr_accessor :file_path
		attr_accessor :file_size
		attr_accessor :file_url
		attr_accessor :file_content
		attr_accessor :file_disc_size

		def id=(val)
			@id = val.to_i
		end
		def partner_id=(val)
			@partner_id = val.to_i
		end
		def object_type=(val)
			@object_type = val.to_i
		end
		def object_sub_type=(val)
			@object_sub_type = val.to_i
		end
		def original=(val)
			@original = val.to_i
		end
		def created_at=(val)
			@created_at = val.to_i
		end
		def updated_at=(val)
			@updated_at = val.to_i
		end
		def ready_at=(val)
			@ready_at = val.to_i
		end
		def sync_time=(val)
			@sync_time = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def file_type=(val)
			@file_type = val.to_i
		end
		def linked_id=(val)
			@linked_id = val.to_i
		end
		def link_count=(val)
			@link_count = val.to_i
		end
		def file_size=(val)
			@file_size = val.to_i
		end
		def file_disc_size=(val)
			@file_disc_size = val.to_i
		end
	end

	class FlavorParamsOutput < FlavorParams
		attr_accessor :flavor_params_id
		attr_accessor :command_lines_str
		attr_accessor :flavor_params_version
		attr_accessor :flavor_asset_id
		attr_accessor :flavor_asset_version
		attr_accessor :ready_behavior

		def flavor_params_id=(val)
			@flavor_params_id = val.to_i
		end
		def ready_behavior=(val)
			@ready_behavior = val.to_i
		end
	end

	class MediaInfo < ObjectBase
		attr_accessor :id
		attr_accessor :flavor_asset_id
		attr_accessor :file_size
		attr_accessor :container_format
		attr_accessor :container_id
		attr_accessor :container_profile
		attr_accessor :container_duration
		attr_accessor :container_bit_rate
		attr_accessor :video_format
		attr_accessor :video_codec_id
		attr_accessor :video_duration
		attr_accessor :video_bit_rate
		attr_accessor :video_bit_rate_mode
		attr_accessor :video_width
		attr_accessor :video_height
		attr_accessor :video_frame_rate
		attr_accessor :video_dar
		attr_accessor :video_rotation
		attr_accessor :audio_format
		attr_accessor :audio_codec_id
		attr_accessor :audio_duration
		attr_accessor :audio_bit_rate
		attr_accessor :audio_bit_rate_mode
		attr_accessor :audio_channels
		attr_accessor :audio_sampling_rate
		attr_accessor :audio_resolution
		attr_accessor :writing_lib
		attr_accessor :raw_data

		def id=(val)
			@id = val.to_i
		end
		def file_size=(val)
			@file_size = val.to_i
		end
		def container_duration=(val)
			@container_duration = val.to_i
		end
		def container_bit_rate=(val)
			@container_bit_rate = val.to_i
		end
		def video_duration=(val)
			@video_duration = val.to_i
		end
		def video_bit_rate=(val)
			@video_bit_rate = val.to_i
		end
		def video_bit_rate_mode=(val)
			@video_bit_rate_mode = val.to_i
		end
		def video_width=(val)
			@video_width = val.to_i
		end
		def video_height=(val)
			@video_height = val.to_i
		end
		def video_frame_rate=(val)
			@video_frame_rate = val.to_f
		end
		def video_dar=(val)
			@video_dar = val.to_f
		end
		def video_rotation=(val)
			@video_rotation = val.to_i
		end
		def audio_duration=(val)
			@audio_duration = val.to_i
		end
		def audio_bit_rate=(val)
			@audio_bit_rate = val.to_i
		end
		def audio_bit_rate_mode=(val)
			@audio_bit_rate_mode = val.to_i
		end
		def audio_channels=(val)
			@audio_channels = val.to_i
		end
		def audio_sampling_rate=(val)
			@audio_sampling_rate = val.to_i
		end
		def audio_resolution=(val)
			@audio_resolution = val.to_i
		end
	end

	class CountryRestriction < BaseRestriction
		attr_accessor :country_restriction_type
		attr_accessor :country_list

		def country_restriction_type=(val)
			@country_restriction_type = val.to_i
		end
	end

	class DirectoryRestriction < BaseRestriction
		attr_accessor :directory_restriction_type

		def directory_restriction_type=(val)
			@directory_restriction_type = val.to_i
		end
	end

	class SessionRestriction < BaseRestriction

	end

	class PreviewRestriction < SessionRestriction
		attr_accessor :preview_length

		def preview_length=(val)
			@preview_length = val.to_i
		end
	end

	class SiteRestriction < BaseRestriction
		attr_accessor :site_restriction_type
		attr_accessor :site_list

		def site_restriction_type=(val)
			@site_restriction_type = val.to_i
		end
	end

	class DocumentEntry < BaseEntry
		attr_accessor :document_type

		def document_type=(val)
			@document_type = val.to_i
		end
	end

	class GoogleVideoSyndicationFeed < BaseSyndicationFeed
		attr_accessor :adult_content

	end

	class ITunesSyndicationFeed < BaseSyndicationFeed
		attr_accessor :feed_description
		attr_accessor :language
		attr_accessor :feed_landing_page
		attr_accessor :owner_name
		attr_accessor :owner_email
		attr_accessor :feed_image_url
		attr_accessor :category
		attr_accessor :adult_content
		attr_accessor :feed_author

	end

	class TubeMogulSyndicationFeed < BaseSyndicationFeed
		attr_accessor :category

	end

	class YahooSyndicationFeed < BaseSyndicationFeed
		attr_accessor :category
		attr_accessor :adult_content
		attr_accessor :feed_description
		attr_accessor :feed_landing_page

	end

    class Client < ClientBase
		attr_reader :access_control_service
		def access_control_service
			if (@access_control_service == nil)
				@access_control_service = Kaltura::Service::AccessControlService.new(self)
			end
			return @access_control_service
		end
		attr_reader :admin_user_service
		def admin_user_service
			if (@admin_user_service == nil)
				@admin_user_service = Kaltura::Service::AdminUserService.new(self)
			end
			return @admin_user_service
		end
		attr_reader :base_entry_service
		def base_entry_service
			if (@base_entry_service == nil)
				@base_entry_service = Kaltura::Service::BaseEntryService.new(self)
			end
			return @base_entry_service
		end
		attr_reader :bulk_upload_service
		def bulk_upload_service
			if (@bulk_upload_service == nil)
				@bulk_upload_service = Kaltura::Service::BulkUploadService.new(self)
			end
			return @bulk_upload_service
		end
		attr_reader :category_service
		def category_service
			if (@category_service == nil)
				@category_service = Kaltura::Service::CategoryService.new(self)
			end
			return @category_service
		end
		attr_reader :conversion_profile_service
		def conversion_profile_service
			if (@conversion_profile_service == nil)
				@conversion_profile_service = Kaltura::Service::ConversionProfileService.new(self)
			end
			return @conversion_profile_service
		end
		attr_reader :data_service
		def data_service
			if (@data_service == nil)
				@data_service = Kaltura::Service::DataService.new(self)
			end
			return @data_service
		end
		attr_reader :email_ingestion_profile_service
		def email_ingestion_profile_service
			if (@email_ingestion_profile_service == nil)
				@email_ingestion_profile_service = Kaltura::Service::EmailIngestionProfileService.new(self)
			end
			return @email_ingestion_profile_service
		end
		attr_reader :flavor_asset_service
		def flavor_asset_service
			if (@flavor_asset_service == nil)
				@flavor_asset_service = Kaltura::Service::FlavorAssetService.new(self)
			end
			return @flavor_asset_service
		end
		attr_reader :flavor_params_service
		def flavor_params_service
			if (@flavor_params_service == nil)
				@flavor_params_service = Kaltura::Service::FlavorParamsService.new(self)
			end
			return @flavor_params_service
		end
		attr_reader :live_stream_service
		def live_stream_service
			if (@live_stream_service == nil)
				@live_stream_service = Kaltura::Service::LiveStreamService.new(self)
			end
			return @live_stream_service
		end
		attr_reader :media_service
		def media_service
			if (@media_service == nil)
				@media_service = Kaltura::Service::MediaService.new(self)
			end
			return @media_service
		end
		attr_reader :mixing_service
		def mixing_service
			if (@mixing_service == nil)
				@mixing_service = Kaltura::Service::MixingService.new(self)
			end
			return @mixing_service
		end
		attr_reader :notification_service
		def notification_service
			if (@notification_service == nil)
				@notification_service = Kaltura::Service::NotificationService.new(self)
			end
			return @notification_service
		end
		attr_reader :partner_service
		def partner_service
			if (@partner_service == nil)
				@partner_service = Kaltura::Service::PartnerService.new(self)
			end
			return @partner_service
		end
		attr_reader :playlist_service
		def playlist_service
			if (@playlist_service == nil)
				@playlist_service = Kaltura::Service::PlaylistService.new(self)
			end
			return @playlist_service
		end
		attr_reader :report_service
		def report_service
			if (@report_service == nil)
				@report_service = Kaltura::Service::ReportService.new(self)
			end
			return @report_service
		end
		attr_reader :search_service
		def search_service
			if (@search_service == nil)
				@search_service = Kaltura::Service::SearchService.new(self)
			end
			return @search_service
		end
		attr_reader :session_service
		def session_service
			if (@session_service == nil)
				@session_service = Kaltura::Service::SessionService.new(self)
			end
			return @session_service
		end
		attr_reader :stats_service
		def stats_service
			if (@stats_service == nil)
				@stats_service = Kaltura::Service::StatsService.new(self)
			end
			return @stats_service
		end
		attr_reader :syndication_feed_service
		def syndication_feed_service
			if (@syndication_feed_service == nil)
				@syndication_feed_service = Kaltura::Service::SyndicationFeedService.new(self)
			end
			return @syndication_feed_service
		end
		attr_reader :system_service
		def system_service
			if (@system_service == nil)
				@system_service = Kaltura::Service::SystemService.new(self)
			end
			return @system_service
		end
		attr_reader :ui_conf_service
		def ui_conf_service
			if (@ui_conf_service == nil)
				@ui_conf_service = Kaltura::Service::UiConfService.new(self)
			end
			return @ui_conf_service
		end
		attr_reader :upload_service
		def upload_service
			if (@upload_service == nil)
				@upload_service = Kaltura::Service::UploadService.new(self)
			end
			return @upload_service
		end
		attr_reader :user_service
		def user_service
			if (@user_service == nil)
				@user_service = Kaltura::Service::UserService.new(self)
			end
			return @user_service
		end
		attr_reader :widget_service
		def widget_service
			if (@widget_service == nil)
				@widget_service = Kaltura::Service::WidgetService.new(self)
			end
			return @widget_service
		end
		attr_reader :x_internal_service
		def x_internal_service
			if (@x_internal_service == nil)
				@x_internal_service = Kaltura::Service::XInternalService.new(self)
			end
			return @x_internal_service
		end
		attr_reader :system_user_service
		def system_user_service
			if (@system_user_service == nil)
				@system_user_service = Kaltura::Service::SystemUserService.new(self)
			end
			return @system_user_service
		end
		attr_reader :system_partner_service
		def system_partner_service
			if (@system_partner_service == nil)
				@system_partner_service = Kaltura::Service::SystemPartnerService.new(self)
			end
			return @system_partner_service
		end
		attr_reader :file_sync_service
		def file_sync_service
			if (@file_sync_service == nil)
				@file_sync_service = Kaltura::Service::FileSyncService.new(self)
			end
			return @file_sync_service
		end
		attr_reader :flavor_params_output_service
		def flavor_params_output_service
			if (@flavor_params_output_service == nil)
				@flavor_params_output_service = Kaltura::Service::FlavorParamsOutputService.new(self)
			end
			return @flavor_params_output_service
		end
		attr_reader :media_info_service
		def media_info_service
			if (@media_info_service == nil)
				@media_info_service = Kaltura::Service::MediaInfoService.new(self)
			end
			return @media_info_service
		end
		attr_reader :entry_admin_service
		def entry_admin_service
			if (@entry_admin_service == nil)
				@entry_admin_service = Kaltura::Service::EntryAdminService.new(self)
			end
			return @entry_admin_service
		end
  end #class KalturaClient

end #module Kaltura
