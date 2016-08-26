module ArgumentSpecification
  module Matchers
    class BeNil < BaseMatcher
      matcher_name :be_nil

      # Check if the actual object matches
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        begin
          @actual.nil?
        rescue NoMethodError
          false
        end
      end
    end
  end
end
