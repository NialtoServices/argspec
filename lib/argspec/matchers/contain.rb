module ArgumentSpecification
  module Matchers
    class Contain < BaseMatcher
      matcher_name :contain

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (Object)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::Contain.new(Symbol)
      #   => #<ArgumentSpecification::Matchers::Contain:0x00000000000000 @expected=Symbol>
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
        @actual.include?(@expected)
      end
    end
  end
end
