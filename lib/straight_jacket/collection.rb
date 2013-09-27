module StraightJacket
  class Collection

    def initialize(param, required = false, &block)
      @param = param
      @required = required
      @validator = block
    end

    def matches?(request)
      if request.parameters.has_key?(param)
        value = request.parameters[param]
        if value.respond_to?(:all?)
          value.all? do |value|
            validator.call(value)
          end
        else
          false
        end
      else
        !required
      end
    end

    private

    attr_reader :param, :required, :validator

  end
end
