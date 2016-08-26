module ArgumentSpecification
  class << self
    # Require dependencies
    #
    # Example:
    #   >> ArgumentSpecification.require!
    #   => nil
    #
    def require!
      require 'argspec/constants'
      require 'argspec/dsl'
      require 'argspec/dsl/matchers'
      require 'argspec/matchers'
      require 'argspec/argument'

      nil
    end
  end
end

ArgumentSpecification.require!
