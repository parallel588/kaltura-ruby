module Kaltura
  module Service
    ##
    # The media service allows you to interact with video, image and audio files on the Kaltura system.
    # This is the service you'll be performing the bulk of your actions on and becoming familiar with
    # it would be beneficial for any application development you perform.  The KMC and the two upload
    # widgets (KCW and KSU) both use this API to upload content to the Kaltura database as well.
    #
    # @example Retrieve a media entry:
    #   client.media_service.get('1_qua324a')
    #
    # @example Upload a new entry:
	  #   media_entry = Kaltura::MediaEntry.new
	  #   media_entry.media_type = Kaltura::Constants::Media::Type::VIDEO
	  #   video_file = File.open "/home/prob/video.mp4"
	  #   begin
	  #     video_token = client.media_service.upload(video_file)
	  #     created_entry = client.media_service.add_from_uploaded_file(media_entry,video_token)
	  #   rescue Kaltura::APIError => e
	  #   end
    #
    # @example Update an existing entry:
    #   update_entry = Kaltura::MediaEntry.new
    #   update_entry.description = "Pancakes are lame yo."
    #   client.media_service.update('1_qua324a',update_entry)
    #
    # @example Delete an existing entry:
    #   client.media_service.delete('1_qua324a')
    #
    # @example Update an Entry thumbnail via file upload:
    #   thumbnail_file = File.open('/path/to/thumbnail_file')
    #   client.media_service.update_thumbnail_from_jpeg('1_qua324a',thumbnail_file)
    #
    # @example Update an entry thumbnail from a url:
    #   client.media_service.update_thumbnail_from_url('1_qua324a','http://twitter.com/waffles/waffletastic.jpg')
    #
    # @example Update an entry thumbnail from another entry:
    #   client.media_service.update_thumbnail_from_source_entry('1_qua324a','0_k24aj1b',5)
    ##
  	class MediaService < BaseService

  	  ##
  	  # This method creates a new media entry from either a HTTP or FTP URL given a batch ID.
  	  # The intention of this action is to import videos in large quantities from another
  	  # service without overloading either the former service nor Kaltura.  This is probably
  	  # best handled from within the KMC with their batch importing wizard, even though this is
  	  # exposed to anyone on API wrappers.
  	  #
  	  # @param [Kaltura::MediaEntry] media_entry A newly insantiated media entry with metadata
  	  #   filled out that will be later returned with the ID field as stored on the database.
  	  # @param [String] url A HTTP or FTP URL.  I would imagine the FTP cannot be password protected.
  	  # @param [Integer] bulk_upload_id The ID of the bulk upload job.
  	  #
  	  # @return [Kaltura::MediaEntry] Returns a media entry object with the metadata fields filled
  	  #   out with the additional database fields the Kaltura service set.  It would be a good idea
  	  #   to store the ID somewhere.
  	  #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors plus 'PROPERTY_VALIDATION_MIN_LENGTH'
  	  #   when a specific attribute of the media entry doesn't have a long enough length and
  	  #   'PROPERTY_VALIDATION_CANNOT_BE_NULL' when a specific attribute is not allowed to be null.
  	  #
  	  ##
  		def add_from_bulk(media_entry, url, bulk_upload_id)
  			kparams = {}
  			client.add_param(kparams, 'mediaEntry', media_entry)
  			client.add_param(kparams, 'url', url)
  			client.add_param(kparams, 'bulkUploadId', bulk_upload_id)
  			perform_request('media','addFromBulk',kparams,false)
  		end

      ##
      # Adds a new media entry for importing from a HTTP or FTP URL.
      # The entry is first queued for uploading, then once that is complete it is queued for
      # encoding.  This gives you a long period between uploading and determining if the media entry
      # is in a valid conversion format.  A Kaltura player wil first raise the error 'Media clip not found' and
      # eventually 'Media is currently converting, try again in a few minutes' if you expose the media entry
      # to new users immediately.
      #
  	  # @param [Kaltura::MediaEntry] media_entry A newly insantiated media entry with metadata
  	  #   filled out that will be later returned with the ID field as stored on the database.
  	  # @param [String] url A HTTP or FTP URL.  I would imagine the FTP cannot be password protected.
  	  # @param [Integer] bulk_upload_id The ID of the bulk upload job.
  	  #
  	  # @return [Kaltura::MediaEntry] Returns a media entry object with the metadata fields filled
  	  #   out with the additional database fields the Kaltura service set.  It would be a good idea
  	  #   to store the ID somewhere.
  	  #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors plus 'PROPERTY_VALIDATION_MIN_LENGTH'
  	  #   when a specific attribute of the media entry doesn't have a long enough length and
  	  #   'PROPERTY_VALIDATION_CANNOT_BE_NULL' when a specific attribute is not allowed to be null.
  	  #
      ##
  		def add_from_url(media_entry, url)
  			kparams = {}
  			client.add_param(kparams, 'mediaEntry', media_entry)
  			client.add_param(kparams, 'url', url)
  			perform_request('media','addFromUrl',kparams,false)
  		end

      ##
      # Adds a new media entry from the results of a search.
      # This action is used by the KCW on the third tab, finding videos from external sources.
      # I wouldn't typically consider using this method as an external user of the Kaltura API.
      #
  	  # @param [Kaltura::MediaEntry] media_entry A newly insantiated media entry with metadata
  	  #   filled out that will be later returned with the ID field as stored on the database.
  	  # @param [Kaltura::SearchResult] search_result A specific Kaltura entry provided from a search provided
  	  #   by Kaltura.
  	  #
  	  # @return [Kaltura::MediaEntry] Returns a media entry object with the metadata fields filled
  	  #   out with the additional database fields the Kaltura service set.  It would be a good idea
  	  #   to store the ID somewhere.
  	  #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors plus 'PROPERTY_VALIDATION_MIN_LENGTH'
  	  #   when a specific attribute of the media entry doesn't have a long enough length and
  	  #   'PROPERTY_VALIDATION_CANNOT_BE_NULL' when a specific attribute is not allowed to be null.
  	  #
      ##
  		def add_from_search_result(media_entry=nil, search_result=nil)
  			kparams = {}
  			client.add_param(kparams, 'mediaEntry', media_entry)
  			client.add_param(kparams, 'searchResult', search_result)
  			perform_request('media','addFromSearchResult',kparams,false)
  		end

      ##
      # Adds a new media entry given a valid upload token.
      # This method is the second step of the uploading process if you wish to upload local content
      # into Kaltura.  This skips the importing queue step, allowing you to have a better idea as to when
      # you can expose the media entry to the end-user.
      #
  	  # @param [Kaltura::MediaEntry] media_entry A newly insantiated media entry with metadata
  	  #   filled out that will be later returned with the ID field as stored on the database.
  	  # @param [String] upload_token_id An upload token returned from Kaltura::Service::MediaService#upload
  	  #
  	  # @return [Kaltura::MediaEntry] Returns a media entry object with the metadata fields filled
  	  #   out with the additional database fields the Kaltura service set.  It would be a good idea
  	  #   to store the ID somewhere.
  	  #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors plus 'PROPERTY_VALIDATION_MIN_LENGTH'
  	  #   when a specific attribute of the media entry doesn't have a long enough length and
  	  #   'PROPERTY_VALIDATION_CANNOT_BE_NULL' when a specific attribute is not allowed to be null.
  	  #   Also raises 'UPLOADED_FILE_NOT_FOUND_BY_TOKEN' if the upload_token_id is invalid.
  	  #
  	  # @example This is how a full upload process looks like:
  	  #   media_entry = Kaltura::MediaEntry.new
  	  #   media_entry.media_type = Kaltura::Constants::Media::Type::VIDEO
  	  #   video_file = File.open "/home/prob/video.mp4"
  	  #   begin
  	  #     video_token = client.media_service.upload(video_file)
  	  #     created_entry = client.media_service.add_from_uploaded_file(media_entry,video_token)
  	  #   rescue Kaltura::APIError => e
  	  #   end
  	  #
      ##
  		def add_from_uploaded_file(media_entry, upload_token_id)
  			kparams = {}
  			client.add_param(kparams, 'mediaEntry', media_entry)
  			client.add_param(kparams, 'uploadTokenId', upload_token_id)
  			perform_request('media','addFromUploadedFile',kparams,false)
  		end

      ##
      # Adds a new media entry after the file was recorded on the server and the token ID exists.
      # This is a method that the KCW uses to add recorded webcam files into the database.  You can
      # mimic this by using the exact same steps as Kaltura::Service::MediaService#add_from_uploaded_file
      # but you then really wouldn't need to use this action at all.
      #
  	  # @param [Kaltura::MediaEntry] media_entry A newly insantiated media entry with metadata
  	  #   filled out that will be later returned with the ID field as stored on the database.
  	  # @param [String] webcam_token_id An upload token returned from somewhere not documented by Kaltura.
  	  #
  	  # @return [Kaltura::MediaEntry] Returns a media entry object with the metadata fields filled
  	  #   out with the additional database fields the Kaltura service set.  It would be a good idea
  	  #   to store the ID somewhere.
  	  #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors plus 'PROPERTY_VALIDATION_MIN_LENGTH'
  	  #   when a specific attribute of the media entry doesn't have a long enough length and
  	  #   'PROPERTY_VALIDATION_CANNOT_BE_NULL' when a specific attribute is not allowed to be null.
  	  #   Also raises 'RECORDED_WEBCAM_FILE_NOT_FOUND_BY_TOKEN' if the upload_token_id is invalid.
  	  #
  	  #
      ##
  		def add_from_recorded_webcam(media_entry, webcam_token_id)
  			kparams = {}
  			client.add_param(kparams, 'mediaEntry', media_entry)
  			client.add_param(kparams, 'webcamTokenId', webcam_token_id)
  			perform_request('media','addFromRecordedWebcam',kparams,false)
  		end


  		##
  		# Copies one entry into a new entry.
  		# If a specific encoding type is not specified for the new entries source, it will
  		# default to the old entries original flavor.
  		# This method was not in the original kaltura-ruby and was discovered from the
  		# API docs.
      #
  	  # @param [Kaltura::MediaEntry] media_entry A newly insantiated media entry with metadata
  	  #   filled out that will be later returned with the ID field as stored on the database.
  	  # @param [String] source_entry_id The media entry to copy from.
  	  # @param [Integer] source_flavor_params_id The encoding type to use as the original flavor for
  	  #   the new entry.
  	  #
  	  # @return [Kaltura::MediaEntry] Returns a media entry object with the metadata fields filled
  	  #   out with the additional database fields the Kaltura service set.  It would be a good idea
  	  #   to store the ID somewhere.
  	  #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors.
  	  # @since 0.4.7
  	  #
  		##
  		def add_from_entry(media_entry, source_entry_id,source_flavor_params_id=nil)
  		  kparams = {}
  		  client.add_params(kparams,'mediaEntry',media_entry)
  		  client.add_params(kparams,'sourceEntryId',source_entry_id)
  		  client.add_params(kparams,'sourceFlavorParamsId',source_flavor_params_id)
  		  perform_request('media','addFromEntry',kparams,false)
		  end

		  ##
		  # Copies a specific flavor into a new Media Entry.
      #
  	  # @param [Kaltura::MediaEntry] media_entry A newly insantiated media entry with metadata
  	  #   filled out that will be later returned with the ID field as stored on the database.
  	  # @param [String] source_flavor_asset_id A specific flavor to use as the source of the copy.
  	  #
  	  # @return [Kaltura::MediaEntry] Returns a media entry object with the metadata fields filled
  	  #   out with the additional database fields the Kaltura service set.  It would be a good idea
  	  #   to store the ID somewhere.
  	  #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors.
  	  # @since 0.4.7
  	  #
		  ##
      def add_from_flavor_asset(media_entry, source_flavor_asset_id)
        kparams = {}
        client.add_params(kparams,'mediaEntry',media_entry)
        client.add_params(kparams,'sourceFlavorAssetId',source_flavor_asset_id)
        perform_request('media','addFromFlavorAsset',kparams,false)
      end

      ##
      # Converts a media entry.
      # This method was not originallly in kaltura-ruby and was added after peruising the API
      # docs.  I wouldn't suggest using this method.  Any upload action will already trigger a
      # conversion, so instead use request conversion.
      #
      # @param [String] entry_id The media entry to convert.
      # @param [Integer] conversion_profile_id The conversion profile to convert the entry with.
      # @param [Array] dynamic_conversion_attributes An Array of Kaltura::ConversionAttribute .
      #   It would be helpful if that object type existed.
      #
      # @return [Integer] Returns the conversion profile that was converted on the entry_id.
      #
      # @raise [Kaltura::APIError] Raises the default Kaltura errors.
      # @since 0.4.7
      # @todo Add Kaltura::ConversionAttribute.
      ##
      def convert(entry_id,conversion_profile_id,dynamic_conversion_attributes=nil)
        kparams = {}
        client.add_params(kparams,'entryId',entry_id)
        client.add_params(kparams,'conversionProfileId',conversion_profile_id)
        client.add_params(kparams,'dynamicConversionAttributes',dynamic_conversion_attributes)
        perform_request('media','convert',kparams,false)
      end

      ##
      # Retrieves a media entry provided an ID.  Will also return older versions if you know a specific number.
      #
      # @param [String] entry_id The Kaltura media entries ID.
      # @param [Integer] version An optional version number.  Defaults to the most recent version.
      #
  	  # @return [Kaltura::MediaEntry] Returns a media entry object with the metadata fields filled
  	  #   out with the additional database fields the Kaltura service set.  It would be a good idea
  	  #   to store the ID somewhere.
  	  #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors.
      ##
  		def get(entry_id, version=-1)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'version', version)
  			perform_request('media','get',kparams,false)
  		end

      ##
      # Updates a specific media entries metadata.
      # Like all other update actions on the Kaltura service, it is best to instantiate a
      # new media entry object and add any fields you wish to change to the new media entry rather
      # than using a Kaltura::Service::MediaService#get call and then updating that specific entry.
      #
      # @param [String] entry_id The media entry to update.
      # @param [Kaltura:MediaEntry] A newly insantiated media entry with the updated metadata fields in place.
      #
  	  # @return [Kaltura::MediaEntry] Returns a media entry object with the metadata fields filled
  	  #   out with the additional database fields the Kaltura service set.  It would be a good idea
  	  #   to store the ID somewhere.
  	  #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors.
      ##
  		def update(entry_id, media_entry)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'mediaEntry', media_entry)
  			perform_request('media','update',kparams,false)
  		end

      ##
      # Removes the specific entry from the Kaltura database.
      #
      # @param [String] entry_id The media entry to remove.
      #
      # @return [nil] Returns nothing.
      #
  	  # @raise [Kaltura::APIError] Raises the default Kaltura errors.
  	  ##
  		def delete(entry_id)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			perform_request('media','delete',kparams,false)
  		end

      ##
      # Lists media entries given a filter and provides paging support for large lists.
      #
      # @param [Kaltura::Filter::MediaEntryFilter] The filter to list media entries by.
      # @param [Kaltura::FilterPager] The default Kaltura pager.
      #
      # @return [Kaltura::Response::MediaListResponse] Returns a wrapper for Kaltura::Response::BaseResponse.
      #
      # @raise [Kaltura::APIError] Raises default Kaltura errors.
      ##
  		def list(filter=nil, pager=nil)
  			kparams = {}
  			client.add_param(kparams, 'filter', filter)
  			client.add_param(kparams, 'pager', pager)
  			perform_request('media','list',kparams,false)
  		end

      ##
      # Counts the total number of media entries that meet the filter criteria.
      #
      # @param [Kaltura::Filter::MediaEntryFilter] The criteria in which the count will be gathered against.
      #
      # @return [Integer] Returns the total.
      #
      # @raise [Kaltura::APIError] Raises default Kaltura errors.
      ##
  		def count(filter=nil)
  			kparams = {}
  			client.add_param(kparams, 'filter', filter)
  			perform_request('media','count',kparams,false)
  		end

      ##
      # Uploads a media file to Kaltura.
      # This is the first step in creating a media entry from a local file.
      #
      # @param [File] file_data The file to upload.
      #
      # @return [String] Returns the upload token ID to be used for entry creation.
      #
      # @raise [Kalutra::APIError] Raises default Kaltura errors.
      #
      # @see Kaltura::Service::MediaService#add_from_uploaded_file
      ##
  		def upload(file_data)
  			kparams = {}
  			client.add_param(kparams, 'fileData', file_data)
  			perform_request('media','upload',kparams,false)
  		end

      ##
      # Updates a specific media entries thumbnail by a specified time offset in seconds.
      #
      # @param [String] entry_id The Kaltura entry ID.
      # @param [Integer] time_offset The offset in seconds to create the thumbnail.
      #
      # @return [Kaltura::MediaEntry] Returns a Kaltura media entry with the updated version.
      #
      # @raise [Kalutra::APIError] Raises default Kaltura errors.
      ##
  		def update_thumbnail(entry_id, time_offset)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'timeOffset', time_offset)
  			perform_request('media','updateThumbnail',kparams,false)
  		end

      ##
      # Updates a media entries thumbnail from another media entry given a time offset.
      #
      # @param [String] entry_id The entry to be updated.
      # @param [String] source_entry_id The entry to create the thumbnail from.
      # @param [Integer] time_offset The offset in seconds to create the thumbnail.
      #
      # @return [Kaltura::MediaEntry] Returns a kaltura media entry with the updated version.
      #
      # @raise  [Kaltura::APIError] Raises the default Kaltura errors.
      ##
  		def update_thumbnail_from_source_entry(entry_id, source_entry_id, time_offset)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'sourceEntryId', source_entry_id)
  			client.add_param(kparams, 'timeOffset', time_offset)
  			perform_request('media','updateThumbnailFromSourceEntry',kparams,false)
  		end

      ##
      # Updates a media entries thumbnail from a JPEG file.
      #
      # @param [String] entry_id The entry to be updated.
      # @param [File] file_data The JPEG file to use as the new thumbnail.
      #
      # @return [Kaltura::MediaEntry] Returns a kaltura media entry with the updated version.
      #
      # @raise  [Kaltura::APIError] Raises the default Kaltura errors.
      ##
  		def update_thumbnail_jpeg(entry_id, file_data)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'fileData', file_data)
  			perform_request('media','updateThumbnailJpeg',kparams,false)
  		end

      ##
      # Updates a media entries thumbnail given a URL.
      #
      # @param [String] entry_id The entry to be updated.
      # @param [File] file_data The URL of a JPEG file to use as the new thumbnail.
      #
      # @return [Kaltura::MediaEntry] Returns a kaltura media entry with the updated version.
      #
      # @raise  [Kaltura::APIError] Raises the default Kaltura errors.
      ##
  		def update_thumbnail_from_url(entry_id, url)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'url', url)
  			perform_request('media','updateThumbnailFromUrl',kparams,false)
  		end

      ##
      # Requests a new conversion job.
      # Use this over Kaltura::Service::MediaService#convert.
      #
      # @param [String] entry_id The entry to be updated.
      # @param [String] file_format The format to convert to.
      #
      # @return [Integer] The Kalatura::FlavorParams ID converted.
      #
      # @raise [Kaltura::APIError] Raises default Kaltura errors.
      ##
  		def request_conversion(entry_id, file_format)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'fileFormat', file_format)
  			perform_request('media','requestConversion',kparams,false)
  		end

      ##
      # Flags an inappropriate media entry for moderation.
      #
      # @param [Kaltura::ModerationFlag] moderation_flag The flag to apply.
      #
      # @return [nil] Returns nothing
      #
      # @raise [Kaltura::APIError] Raises default Kaltura errors.
      ##
  		def flag(moderation_flag)
  			kparams = {}
  			client.add_param(kparams, 'moderationFlag', moderation_flag)
  			perform_request('media','flag',kparams,false)
  		end

      ##
      # Rejects the media entry and marks all pending flags as moderated.
      # This makes the entry non-playable.
      #
      # @param [String] entry_id The Kaltura media entry to be updated.
      #
      # @return [nil] Returns nothing
      #
      # @raise [Kaltura::APIError] Raises default Kaltura errors.
      ##
  		def reject(entry_id)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			perform_request('media','request',kparams,false)
  		end

      ##
      # Approves the media entry and marks all pending flags as moderated.
      # This makes the entry playable.
      #
      # @param [String] entry_id The Kaltura media entry to be updated.
      #
      # @return [nil] Returns nothing
      #
      # @raise [Kaltura::APIError] Raises default Kaltura errors.
      ##
  		def approve(entry_id)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			perform_request('media','approve',kparams,false)
  		end

      ##
      # Lists all pending moderation flags for the media entry with paging support for numerous flags.
      #
      # @param [String] entry_id The entry to locate moderation flags for.
      # @param [Kaltura::FilterPager] The default Kaltura pager.
      #
      # @return [Kaltura::Response::ModerationFlagListResponse] A wrapper for Kaltura::Response::BaseResponse.
      #
      # @raise [Kaltura::APIError] Raises the defaault Kaltura errors.
      ##
  		def list_flags(entry_id, pager=nil)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'pager', pager)
  			perform_request('media','listFlags',kparams,false)
  		end

      ##
      # Rank a media entry.
      # This does no validation to prevent duplicate rankings.  Fairly worthless.  It is suggested you
      # maintain rankings on your own application.
      #
      # @param [String] The Kaltura entry to be updated.
      # @param [Integer] The rank to apply.
      #
      # @return [nil] Returns nothing.
      #
      # @raise [Kaltura::APIError] Raises default Kaltura errors.
      ##
  		def anonymous_rank(entry_id, rank)
  			kparams = {}
  			client.add_param(kparams, 'entryId', entry_id)
  			client.add_param(kparams, 'rank', rank)
  			perform_request('media','anonymousRank',kparams,false)
  		end
  	end #class MediaService
	end
end
