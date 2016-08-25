module ArgumentSpecification
  module Matchers
    class Cover < BaseMatcher
      matcher_name :cover

      attr_reader :values

      # Create a new matcher instance
      #
      # Arguments:
      #   values: (Splat)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::Cover.new(1, 2)
      #   => #<ArgumentSpecification::Matchers::Cover:0x00000000000000 @values=[1, 2]>
      #
      def initialize(*values)
        @values = values
      end

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        @values.each do |value|
          return false unless @actual.include?(value)
        end

        true
      end
    end
  end
end
