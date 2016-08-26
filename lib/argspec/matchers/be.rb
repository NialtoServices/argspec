module ArgumentSpecification
  module Matchers
    class Be < BaseMatcher
      matcher_name :be

      [:==, :===, :=~, :<, :>, :<=, :>=].each do |operator|
        define_method(operator) do |expected|
          instance = BeComparedTo.new(operator, expected)
          instance.send(:setup, operator, [operator, expected])
          instance
        end
      end

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        !!@actual
      end
    end
  end
end
