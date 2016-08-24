module ArgumentSpecification
  module Matchers
    class << self
      # Get an array of all available matchers
      #
      # Example:
      #   >> all
      #   => [:be, ...]
      #
			def all
				[:be, :be_a, :include]
			end

      # The be matcher
      #
      # Arguments:
      #   argument: (ArgumentSpecification::Argument)
      #   object: (?)
      #
      # Example:
      #   >> test = 'Test'
      #   >> argument(test).should_not(:be, nil)
      #   => nil
      #
			def be(argument, object)
				argument.object == object
			end

      # The be_a matcher
      #
      # Arguments:
      #   argument: (ArgumentSpecification::Argument)
      #   object: (?)
      #
      # Example:
      #   >> test = :test
      #   >> argument(test).should(:be_a, Symbol)
      #   => nil
      #
			def be_a(argument, klass)
				argument.object.is_a?(klass)
			end

      # The include matcher
      #
      # Arguments:
      #   argument: (ArgumentSpecification::Argument)
      #   object: (?)
      #
      # Example:
      #   >> test = [:test]
      #   >> argument(test).should(:include, :test)
      #   => nil
      #
			def include(argument, object)
				argument.object.include?(object)
			end
		end
  end
end
