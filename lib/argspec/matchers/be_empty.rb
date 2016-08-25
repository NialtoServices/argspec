module ArgumentSpecification
  module Matchers
    class BeEmpty < BaseMatcher
      matcher_name :be_empty

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        @actual.empty?
      end
    end
  end
end
