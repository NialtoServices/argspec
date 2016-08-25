module ArgumentSpecification
  module DSL
    class << self
      # Register a matcher
      #
      # Arguments:
      #   klass: (Matchers::BaseMatcher)
      #   name: (Symbol)
      #
      # Example:
      #   >> register_matcher(TestMatcher, :test_matcher)
      #   => true
      #
      def register_matcher(klass, name)
        return unless klass.ancestors.include?(Matchers::BaseMatcher)
        return unless name.is_a?(Symbol)

        module_eval <<-EOS
          def #{name}(*args, &block)
            instance = #{klass}.new(*args, &block)
            instance.send(:setup, '#{name}'.to_sym, args)
            instance
          end
        EOS
      end
    end

    # Get an argument object
    #
    # Arguments:
    #   object: (Object)
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
