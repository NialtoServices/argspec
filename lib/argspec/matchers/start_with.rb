module ArgumentSpecification
  module Matchers
    class StartWith < BaseMatcher
      matcher_name :start_with, :begin_with

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (String)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::StartWith.new("test")
      #   => #<ArgumentSpecification::Matchers::StartWith:0x00000000000000 @expected="test">
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
        @actual.start_with?(@expected)
      end
    end
  end
end
