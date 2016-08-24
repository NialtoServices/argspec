module ArgumentSpecification
  class Argument
    attr_reader :object

    # Create a new argument
    #
    # Arguments:
    #   object: (?)
    #
    # Example:
    #   >> test = :test
    #   >> ArgumentSpecification::Argument.new(test)
    #   => #<Argument:0x00000000000000 @object=:test>
    #
    def initialize(object)
      @object = object
    end

    # Should
    #
    # Arguments:
    #   matcher: (Symbol) A method name as a symbol (see the matchers.rb file)
    #   args: (Splat)
    #
    # Example:
    #   >> argument.should(:be, true)
    #   => nil
    #
    # Raises:
    #   ArgumentError: If the matcher determines the object does not match
    #
    def should(matcher, *args)
      ensure_matcher(matcher)

      return if Matchers.send(matcher, self, *args)

      raise ArgumentError, "'#{prettify_object}' should #{prettify_matcher(matcher)} '#{prettify_args(args)}'"
    end

    # Should not
    #
    # Arguments:
    #   matcher: (Symbol) A method name as a symbol (see the matchers.rb file)
    #   args: (Splat)
    #
    # Example:
    #   >> argument.should_not(:be, true)
    #   => nil
    #
    # Raises:
    #   ArgumentError: If the matcher determines the object does match
    #
    def should_not(matcher, *args)
      ensure_matcher(matcher)

      return if Matchers.send(matcher, self, *args) == false

      raise ArgumentError, "'#{prettify_object}' should not #{prettify_matcher(matcher)} '#{prettify_args(args)}'"
    end

    private
    # Ensure a matcher exists
    #
    # Arguments:
    #   matcher: (Symbol)
    #
    # Example:
    #   >> ensure_matcher(:be)
    #   => nil
    #
    # Raises:
    #   ArgumentError: If the specified matcher does not exist
    #
    def ensure_matcher(matcher)
      return if Matchers.all.include?(matcher)

      raise ArgumentError, "The matcher '#{matcher}' does not exist."
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
    #   args: (Array)
    #
    # Example:
    #   >> prettify_args([:a])
    #   => ":a"
    #
    def prettify_args(args)
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

    # Prettify the object
    #
    # Example:
    #   >> # argument.object = :a
    #   >> prettify_object
    #   => ":a"
    #
    def prettify_object
      prettify_args([@object])
    end
  end
end
