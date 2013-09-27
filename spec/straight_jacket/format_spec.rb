require 'straight_jacket/spec_helper'
require 'straight_jacket/format'

describe StraightJacket::Format do
  include StraightJacket::SpecHelper

  def request(value)
    double(format: double(symbol: value.to_sym))
  end

  it 'matches if the param is equal' do
    described_class.new('json').matches?(request('json')).should be_true
  end

  it 'does not match if the param is not equal' do
    described_class.new('json').matches?(request('son')).should be_false
  end

end
