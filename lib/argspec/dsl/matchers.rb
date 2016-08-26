module ArgumentSpecification
  module DSL
    module Matchers
      class << self
        # Register a matcher
        #
        # Arguments:
        #   klass: (ArgumentSpecification::Matchers::BaseMatcher)
        #   name: (Symbol)
        #
        # Example:
        #   >> Matchers.register(TestMatcher, :test_matcher)
        #   => true
        #
        def register(klass, name)
          return unless klass.ancestors.include?(ArgumentSpecification::Matchers::BaseMatcher)
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
    end
  end
end
