module ArgumentSpecification
  module Matchers
    class BaseMatcher
      class << self
        # Add matcher names
        #
        # Arguments:
        #   names: (Splat)
        #
        # Example:
        #   >> class TestMatcher < BaseMatcher
        #   >>   matcher_name :test_matcher
        #   >> end
        #   => TestMatcher
        #
        def matcher_name(*names)
          names.each do |name|
            next unless name.is_a?(Symbol)

            DSL::Matchers.register(self, name)
          end
        end
      end

      attr_reader :actual, :metadata

      # The failure message when using 'should'
      #
      # Example:
      #   >> matcher.failure_message
      #   => "'test' should be a 'Symbol'"
      #
      def failure_message
        actual = prettify_args(@actual)
        matcher = prettify_matcher(@metadata[:name])

        if @metadata[:args].count > 0
          args = prettify_args(*@metadata[:args])

          "'#{actual}' should #{matcher} '#{args}'"
        else
          "'#{actual}' should #{matcher}"
        end
      end

      # The failure message when using 'should not'
      #
      # Example:
      #   >> matcher.failure_message_when_negated
      #   => "':test' should not be a 'Symbol'"
      #
      def failure_message_when_negated
        actual = prettify_args(@actual)
        matcher = prettify_matcher(@metadata[:name])

        if @metadata[:args].count > 0
          args = prettify_args(*@metadata[:args])

          "'#{actual}' should not #{matcher} '#{args}'"
        else
          "'#{actual}' should not #{matcher}"
        end
      end

      # Check if the actual object matches
      #
      # You must override this method!
      #
      # Example:
      #   >> matcher.matches?
      #   => true
      #
      def matches?
        raise NotImplementedError, 'You must override the matches? method in your matcher.'
      end

      private
      # Setup the matcher
      #
      # Arguments:
      #   name: (Symbol)
      #   args: (Array)
      #
      # Example:
      #   >> matcher.setup(:test_matcher, [])
      #   => { name: :test_matcher, args: [] }
      #
      def setup(name, args)
        @metadata = { name: name, args: args }
      end

      # Set the actual object
      #
      # Arguments:
      #   actual: (Object)
      #
      # Example:
      #   >> matcher.actual = :test
      #   => :test
      #
      def actual=(actual)
        @actual = actual
      end

      # Prettify a matcher
      #
      # Arguments:
      #   matcher: (String)
      #
      # Example:
      #   >> prettify_matcher(:be_a)
      #   => "be a"
      #
      def prettify_matcher(matcher)
        matcher.to_s.gsub('_', ' ')
      end

      # Prettify arguments
      #
      # Arguments:
      #   args: (Splat)
      #
      # Example:
      #   >> prettify_args(:a)
      #   => ":a"
      #
      def prettify_args(*args)
        pretty_args = args.map do |argument|
          if argument == nil
            next 'nil'
          elsif argument.is_a?(Symbol)
            next ":#{argument}"
          else
            next argument
          end
        end

        return 'nil' if pretty_args.empty?
        return pretty_args.first if pretty_args.count == 1

        pretty_args
      end
    end
  end
end
