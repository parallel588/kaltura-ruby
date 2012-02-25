module Kaltura
  module Filter
    class EntryDistributionBaseFilter < BaseFilter
      attr_accessor :id_equal
      attr_accessor :id_in
      attr_accessor :created_at_greater_than_or_equal
      attr_accessor :created_at_less_than_or_equal
      attr_accessor :updated_at_greater_than_or_equal
      attr_accessor :updated_at_less_than_or_equal
      attr_accessor :submitted_at_greater_than_or_equal
      attr_accessor :submitted_at_less_than_or_equal
      attr_accessor :entry_id_equal
      attr_accessor :entry_id_in
      attr_accessor :distribution_profile_id_equal
      attr_accessor :distribution_profile_id_in
      attr_accessor :status_equal
      attr_accessor :status_in
      attr_accessor :dirty_status_equal
      attr_accessor :dirty_status_in
      attr_accessor :sunrise_greater_than_or_equal
      attr_accessor :sunrise_less_than_or_equal
      attr_accessor :sunset_greater_than_or_equal
      attr_accessor :sunset_less_than_or_equal

    end
  end
end
