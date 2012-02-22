module Kaltura
  module Response

    class BaseResponse < ObjectBase
      attr_accessor :objects
      attr_accessor :total_count

      def total_count=(val)
        @total_count = val.to_i
      end
    end

    class AccessControlListResponse < BaseResponse
  	end

    class BaseEntryListResponse < BaseResponse
  	end

  	class ModerationFlagListResponse < BaseResponse
  	end

  	class BulkUploadListResponse < BaseResponse
  	end

  	class CategoryListResponse < BaseResponse
  	end

  	class ConversionProfileListResponse < BaseResponse
  	end

  	class DataListResponse < BaseResponse
  	end

  	class FlavorParamsListResponse < BaseResponse
  	end

  	class LiveStreamListResponse < BaseResponse
  	end

  	class MediaListResponse < BaseResponse
  	end

  	class MixListResponse < BaseResponse
  	end

  	class PlaylistListResponse < BaseResponse
  	end

  	class SearchResultResponse < ObjectBase
  		attr_accessor :objects
  		attr_accessor :need_media_info

  		def need_media_info=(val)
  			@need_media_info = to_b(val)
  		end
  	end

  	class StartWidgetSessionResponse < ObjectBase
  		attr_accessor :partner_id
  		attr_accessor :ks
  		attr_accessor :user_id

  		def partner_id=(val)
  			@partner_id = val.to_i
  		end
  	end

  	class BaseSyndicationFeedListResponse < BaseResponse
  	end

  	class UiConfListResponse < BaseResponse
  	end

  	class UploadResponse < ObjectBase
  		attr_accessor :upload_token_id
  		attr_accessor :file_size
  		attr_accessor :error_code
  		attr_accessor :error_description

  		def file_size=(val)
  			@file_size = val.to_i
  		end
  		def error_code=(val)
  			@error_code = val.to_i
  		end
  	end

  	class UserListResponse < BaseResponse
  	end

  	class WidgetListResponse < BaseResponse
  	end

  	class SystemUserListResponse < BaseResponse
  	end

  	class SystemPartnerUsageListResponse < BaseResponse
  	end

  	class PartnerListResponse < BaseResponse
  	end

  	class FileSyncListResponse < BaseResponse
  	end

  	class FlavorParamsOutputListResponse < BaseResponse
  	end

  	class MediaInfoListResponse < BaseResponse
  	end
    class DistributionProviderListResponse < BaseResponse
    end
    class DistributionProfileListResponse < BaseResponse
    end

  end #module Response
end #module Kaltura
