module ArgumentSpecification
  module DSL
    # Get an argument object
    #
    # Arguments:
    #   object: (?)
    #
    # Example:
    #   >> test = :test
    #   >> argument(test)
    #   => #<Argument:0x00000000000000 @object=:test>
    #
    def argument(object)
      ArgumentSpecification::Argument.new(object)
		end
  end
end
