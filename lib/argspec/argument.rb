module ArgumentSpecification
  class Argument
    include ArgumentSpecification::DSL::Matchers

    attr_reader :actual

    # Create a new argument
    #
    # Arguments:
    #   actual: (Object)
    #   block: (Block)
    #
    # Example:
    #   >> test = :test
    #   >> ArgumentSpecification::Argument.new(test) do
    #   >>   should_not be_nil
    #   >> end
    #   => #<Argument:0x00000000000000 @actual=:test>
    #
    def initialize(actual, &block)
      @actual = actual

      instance_eval(&block)
    end

    # Ensure the argument matches
    #
    # Arguments:
    #   matcher: (Matchers::BaseMatcher)
    #   block: (Block)
    #
    # Example:
    #   >> should be_a(Symbol)
    #   => #<Argument:0x00000000000000 @actual=:test>
    #
    # Raises:
    #   ArgumentError: When the argument does not match
    #
    def should(matcher, &block)
      return self unless matcher.is_a?(Matchers::BaseMatcher)

      matcher.send(:actual=, @actual)
      matcher.send(:block=, block) if block_given?

      return self if matcher.matches?

      raise ArgumentError, matcher.failure_message
    end

    # Ensure the argument does not match
    #
    # Arguments:
    #   matcher: (Matchers::BaseMatcher)
    #   block: (Block)
    #
    # Example:
    #   >> should_not be_a(Symbol)
    #   => #<Argument:0x00000000000000 @actual=:test>
    #
    # Raises:
    #   ArgumentError: When the argument matches
    #
    def should_not(matcher, &block)
      return self unless matcher.is_a?(Matchers::BaseMatcher)

      matcher.send(:actual=, @actual)
      matcher.send(:block=, block) if block_given?

      return self unless matcher.matches?

      raise ArgumentError, matcher.failure_message_when_negated
    end

    # Alias for should
    #
    # Example:
    #   >> and be_a(Symbol)
    #   => #<Argument:0x00000000000000 @actual=:test>
    #
    def and(*args, &block)
      should(*args, &block)
    end

    # Alias for should_not
    #
    # Example:
    #   >> and_not be_a(Symbol)
    #   => #<Argument:0x00000000000000 @actual=:test>
    #
    def and_not(*args, &block)
      should_not(*args, &block)
    end
  end
end
