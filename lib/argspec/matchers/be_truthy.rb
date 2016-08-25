module ArgumentSpecification
  module Matchers
    class BeTruthy < BaseMatcher
      matcher_name :be_truthy

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
