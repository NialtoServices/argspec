module ArgumentSpecification
  module Matchers
    class BeA < BaseMatcher
      matcher_name :be_a, :be_an

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (Class)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::BeA.new(Symbol)
      #   => #<ArgumentSpecification::Matchers::BeA:0x00000000000000 @expected=Symbol>
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
        @actual.is_a?(@expected)
      end
    end
  end
end
