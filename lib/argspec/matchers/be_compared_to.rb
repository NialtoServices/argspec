module ArgumentSpecification
  module Matchers
    class BeComparedTo < BaseMatcher
      attr_reader :operator, :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   operator: (Symbol)
      #   expected: (Object)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::BeComparedTo.new(:==, 10)
      #   => #<ArgumentSpecification::Matchers::BeComparedTo:0x00000000000000 @operator=:==, @expected=10>
      #
      def initialize(operator, expected)
        @operator = operator
        @expected = expected
      end

      # The failure message when using 'should'
      #
      # Example:
      #   >> matcher.failure_message
      #   => "':foo' should be equal to ':test'"
      #
      def failure_message
        actual = prettify_args(@actual)

        "'#{actual}' should #{pretty_matcher} '#{@expected}'"
      end

      # The failure message when using 'should not'
      #
      # Example:
      #   >> matcher.failure_message_when_negated
      #   => "':test' should not be equal to ':test'"
      #
      def failure_message_when_negated
        actual = prettify_args(@actual)

        "'#{actual}' should not #{pretty_matcher} '#{@expected}'"
      end

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        begin
          @actual.send(@operator, @expected)
        rescue ArgumentError
          false
        end
      end

      private
      # Get the pretty matcher name
      #
      # Example:
      #   >> matcher = BeComparedTo.new(:==, 1)
      #   >> matcher.pretty_matcher
      #   => "equal"
      #
      def pretty_matcher
        case @operator
        when :==
          "equal"
        when :===
          "case equal"
        when :=~
          "match"
        when :<
          "be less than"
        when :>
          "be greater than"
        when :<=
          "be less than or equal to"
        when :>=
          "be greater than or equal to"
        else
          "pass comparison #{@operator} to"
        end
      end
    end
  end
end
