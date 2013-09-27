require 'straight_jacket/spec_helper'
require 'straight_jacket/integer_parameter'

describe StraightJacket::IntegerParameter do
  include StraightJacket::SpecHelper

  def request(value)
    build_request({'val' => value})
  end

  def constrainer(required = false)
    described_class.new('val', required)
  end

  it 'matches for nothing when not required' do
    constrainer(false).matches?(request('')).should be_true
    constrainer(false).matches?(request(nil)).should be_true
  end

  it 'does not match on nothing when required' do
    constrainer(true).matches?(request('')).should be_false
    constrainer(true).matches?(request(nil)).should be_false
  end

  it 'accepts a lambda for the required parameter' do
    r = request('')
    required = lambda do |_request|
      _request.should be(r)
      false
    end
    constrainer(required).matches?(r).should be_true
  end

  it 'matches for an integer' do
    constrainer.matches?(request('1')).should be_true
  end

  it 'does not match for a float' do
    constrainer.matches?(request('1.0')).should be_false
  end

  it 'does not match for a string' do
    constrainer.matches?(request('str')).should be_false
  end

end
