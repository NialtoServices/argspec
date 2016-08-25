module ArgumentSpecification
  module Matchers
    class RespondTo < BaseMatcher
      matcher_name :respond_to

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (Symbol)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::RespondTo.new(:hello)
      #   => #<ArgumentSpecification::Matchers::RespondTo:0x00000000000000 @expected=:hello>
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
        @actual.respond_to?(@expected)
      end
    end
  end
end
