module ArgumentSpecification
  module Matchers
    class BeFalsey < BaseMatcher
      matcher_name :be_falsey

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        !@actual
      end
    end
  end
end
