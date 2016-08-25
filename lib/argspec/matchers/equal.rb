module ArgumentSpecification
  module Matchers
    class Equal < BaseMatcher
      matcher_name :equal

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (Object)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::Equal.new(:test)
      #   => #<ArgumentSpecification::Matchers::Equal:0x00000000000000 @expected=:test>
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
        @actual == @expected
      end
    end
  end
end
