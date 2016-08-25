module ArgumentSpecification
  module Matchers
    class BeLessThan < BaseMatcher
      matcher_name :be_less_than

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (Object)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::BeLessThan.new(10)
      #   => #<ArgumentSpecification::Matchers::BeLessThan:0x00000000000000 @expected=10>
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
        @actual < @expected
      end
    end
  end
end
