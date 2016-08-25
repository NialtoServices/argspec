module ArgumentSpecification
  module Matchers
    class Match < BaseMatcher
      matcher_name :match

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (Object)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::Match.new(Symbol)
      #   => #<ArgumentSpecification::Matchers::Match:0x00000000000000 @expected=Symbol>
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
        @actual =~ @expected
      end
    end
  end
end
