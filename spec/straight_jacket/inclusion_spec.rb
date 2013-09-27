require 'straight_jacket/spec_helper'
require 'straight_jacket/inclusion'

describe StraightJacket::Inclusion do
  include StraightJacket::SpecHelper

  def request(value)
    build_request({'val' => value})
  end

  def constrainer(valid_values)
    described_class.new('val', valid_values)
  end

  it 'matches if the value is included in the list' do
    constrainer(['one']).matches?(request('one')).should be_true
    constrainer(['one', 'two']).matches?(request('two')).should be_true
  end

  it 'matches if the value is not present and not requiried' do
    constrainer(['one']).matches?(request('')).should be_true
  end

  it 'does not matches if the value is not present and requiried' do
    described_class.new('val', ['one'], true).matches?(request('')).should be_false
  end

  it 'does not match if the value is not included in the list' do
    constrainer(['one']).matches?(request('two')).should be_false
    constrainer(['one', 'two']).matches?(request('three')).should be_false
  end

end
