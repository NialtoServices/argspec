module ArgumentSpecification
  module Matchers
    class Be < BaseMatcher
      matcher_name :be

      OPERATORS = {
        :==  => :equal,
        :=== => :case_equal,
        :=~  => :match,
        :<   => :be_less_than,
        :>   => :be_greater_than,
        :<=  => :be_less_than_or_equal_to,
        :>=  => :be_greater_than_or_equal_to
      }

      OPERATORS.keys.each do |operator|
        define_method(operator) do |expected|
          send(OPERATORS[operator], expected)
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
