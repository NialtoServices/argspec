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
      require 'argspec/matchers'
      require 'argspec/argument'
      require 'argspec/dsl'

      nil
    end
  end
end

ArgumentSpecification.require!
