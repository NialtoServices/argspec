module ArgumentSpecification
  module Matchers
    class Cover < BaseMatcher
      matcher_name :cover, :contain

      attr_reader :values

      # Create a new matcher instance
      #
      # Arguments:
      #   values: (Splat)
      #
      # Example:
      #   >> ArgumentSpecification::Matchers::Cover.new(:a, :b)
      #   => #<ArgumentSpecification::Matchers::Cover:0x00000000000000 @values=[:a, :b]>
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
        symbol = @actual.is_a?(Symbol)
        actual = symbol ? @actual.to_s : @actual
        values = symbol ? @values.map { |v| v.is_a?(Symbol) ? v.to_s : v } : @values

        values.each do |value|
          return false unless actual.include?(value)
        end

        true
      end
    end
  end
end
