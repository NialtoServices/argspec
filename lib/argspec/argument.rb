module ArgumentSpecification
  class Argument
    attr_reader :actual

    # Create a new argument
    #
    # Arguments:
    #   actual: (Object)
    #
    # Example:
    #   >> test = :test
    #   >> ArgumentSpecification::Argument.new(test)
    #   => #<Argument:0x00000000000000 @actual=:test>
    #
    def initialize(actual)
      @actual = actual
    end

    # Ensure the argument matches
    #
    # Arguments:
    #   matcher: (Matchers::BaseMatcher)
    #
    # Example:
    #   >> argument.should be_a(Symbol)
    #   => nil
    #
    # Raises:
    #   ArgumentError: When the argument does not match
    #
    def should(matcher)
      return nil unless matcher.is_a?(Matchers::BaseMatcher)

      matcher.send(:actual=, @actual)

      return nil if matcher.matches?

      raise ArgumentError, matcher.failure_message
    end

    # Ensure the argument does not match
    #
    # Arguments:
    #   matcher: (Matchers::BaseMatcher)
    #
    # Example:
    #   >> argument.should_not be_a(Symbol)
    #   => nil
    #
    # Raises:
    #   ArgumentError: When the argument matches
    #
    def should_not(matcher)
      return nil unless matcher.is_a?(Matchers::BaseMatcher)

      matcher.send(:actual=, @actual)

      return nil unless matcher.matches?

      raise ArgumentError, matcher.failure_message_when_negated
    end
  end
end
