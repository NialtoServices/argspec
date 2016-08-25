module ArgumentSpecification
  module Matchers
    class All < BaseMatcher
      matcher_name :all

      attr_reader :expected

      # Create a new matcher instance
      #
      # Arguments:
      #   expected: (BaseMatcher)
      #
      # Example:
      #   >> symbol_matcher = ArgumentSpecification::Matchers::BeA.new(Symbol)
      #   >> ArgumentSpecification::Matchers::All.new(symbol_matcher)
      #   => #<ArgumentSpecification::Matchers::All:0x00000000000000 @expected=#<ArgumentSpecification::Matchers::BeA:0x00000000000000 @expected=Symbol>>
      #
      def initialize(expected)
        if expected.is_a?(BaseMatcher) == false || expected.is_a?(All)
          raise ArgumentError, 'You must provide a matcher as an argument (excluding the all matcher).'
        end

        @expected = expected
      end

      # The failure message when using 'should'
      #
      # Example:
      #   >> matcher.failure_message
      #   => "'test' should be a 'Symbol'"
      #
      def failure_message
        actual = prettify_args(@actual)
        matcher = prettify_matcher(@expected.metadata[:name])

        if @expected.metadata[:args].count > 0
          args = prettify_args(*@expected.metadata[:args])

          "'#{actual}' should all #{matcher} '#{args}'"
        else
          "'#{actual}' should all #{matcher}"
        end
      end

      # The failure message when using 'should not'
      #
      # Example:
      #   >> matcher.failure_message_when_negated
      #   => "':test' should not be a 'Symbol'"
      #
      def failure_message_when_negated
        actual = prettify_args(@actual)
        matcher = prettify_matcher(@expected.metadata[:name])

        if @expected.metadata[:args].count > 0
          args = prettify_args(*@expected.metadata[:args])

          "'#{actual}' should not all #{matcher} '#{args}'"
        else
          "'#{actual}' should not all #{matcher}"
        end
      end

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        actual = @actual.is_a?(Array) ? @actual : [@actual]
        actual.each do |value|
          @expected.send(:actual=, value)

          return false unless @expected.matches?
        end

        true
      end
    end
  end
end
