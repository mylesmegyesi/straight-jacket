require 'active_support/core_ext/object'
require 'straight_jacket/validator'

module StraightJacket

  class IntegerParameter
    def initialize(param, required = false)
      @param = param
      case
      when !!required == required # is a boolean
        @required = lambda { |request| required }
      when required.is_a?(Proc)
        @required = required
      else
        @required = lambda { |request| false }
      end
    end

    def matches?(request)
      if value = request.parameters[@param].presence
        Validator.int?(value)
      else
        !required.call(request)
      end
    end

    private

    attr_reader :required

  end
end
