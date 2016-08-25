module ArgumentSpecification
  module Matchers
    class BeGreaterThanOrEqualTo < BaseMatcher
      matcher_name :be_greater_than_or_equal_to

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (Object)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::BeGreaterThanOrEqualTo.new(10)
      #   => #<ArgumentSpecification::Matchers::BeGreaterThanOrEqualTo:0x00000000000000 @expected=10>
      #
      def initialize(expected)
        @expected = expected
      end

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        @actual >= @expected
      end
    end
  end
end
