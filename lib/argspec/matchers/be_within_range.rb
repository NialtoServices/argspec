module ArgumentSpecification
  module Matchers
    class BeWithinRange < BaseMatcher
      matcher_name :be_within_range

      attr_reader :range

      # Create a new matcher instance
      #
      # Arguments:
      #   range: (Range)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::BeWithinRange.new(1..10)
      #   => #<ArgumentSpecification::Matchers::BeWithinRange:0x00000000000000 @range=1..10>
      #
      def initialize(range)
        @range = range
      end

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        @range.include?(@actual)
      end
    end
  end
end
