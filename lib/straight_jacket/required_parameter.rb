module StraightJacket
  class RequiredParameter

    def initialize(param)
      @param = param
    end

    def matches?(request)
      !!request.parameters[@param].presence
    end

    private

    attr_reader :param

  end
end
