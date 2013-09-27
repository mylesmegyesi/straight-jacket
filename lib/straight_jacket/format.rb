module StraightJacket
  class Format

    def initialize(format)
      @format = format.to_sym
    end

    def matches?(request)
      request.format.symbol == format
    end

    private

    attr_reader :format

  end
end
