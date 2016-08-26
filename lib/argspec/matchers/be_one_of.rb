module ArgumentSpecification
  module Matchers
    class BeOneOf < BaseMatcher
      matcher_name :be_one_of

      attr_reader :values

      # Create a new matcher instance
      #
      # Arguments:
      #   values: (Splat|Range)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::BeOneOf.new(1, 2)
      #   => #<ArgumentSpecification::Matchers::BeOneOf:0x00000000000000 @values=[1, 2]>
      #
      def initialize(*values)
        if values && values.first.is_a?(Range)
          @values = values.first.to_a
        else
          @values = values
        end
      end

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        @values.include?(@actual)
      end
    end
  end
end
