module ArgumentSpecification
  module Matchers
    class Satisfy < BaseMatcher
      matcher_name :satisfy

      attr_reader :description, :block

      # Create a new matcher instance
      #
      # Arguments:
      #   description: (String)
      #   block: (Block)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::Satisfy.new('always pass') { true }
      #   => #<ArgumentSpecification::Matchers::Satisfy:0x00000000000000 @block=#<Proc:0x00000000000000>>
      #
      def initialize(description, &block)
        @description = description
        @block = block
      end

      # The failure message when using 'should'
      #
      # Example:
      #   >> matcher.failure_message
      #   => "'test' should always pass"
      #
      def failure_message
        actual = prettify_args(@actual)

        if @description
          "'#{actual}' should #{@description}"
        else
          "'#{actual}' should satisfy the requirements"
        end
      end

      # The failure message when using 'should not'
      #
      # Example:
      #   >> matcher.failure_message_when_negated
      #   => "':test' should not always pass"
      #
      def failure_message_when_negated
        actual = prettify_args(@actual)

        if @description
          "'#{actual}' should not #{@description}"
        else
          "'#{actual}' should not satisfy the requirements"
        end
      end

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        @block.call(@actual)
      end
    end
  end
end
