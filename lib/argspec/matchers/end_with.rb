module ArgumentSpecification
  module Matchers
    class EndWith < BaseMatcher
      matcher_name :end_with

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (String)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::EndWith.new("test")
      #   => #<ArgumentSpecification::Matchers::EndWith:0x00000000000000 @expected="test">
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
        @actual.end_with?(@expected)
      end
    end
  end
end
