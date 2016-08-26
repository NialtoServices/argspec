module ArgumentSpecification
  module DSL
    # Get an argument object
    #
    # Arguments:
    #   object: (Object)
    #   block: (Block)
    #
    # Example:
    #   >> test = :test
    #   >> argument(test) { should_not be_nil }
    #   => nil
    #
    def argument(object, &block)
      ArgumentSpecification::Argument.new(object, &block)

      nil
		end
  end
end
