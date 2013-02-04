require 'spec_helper'
require 'prime'

RSpec::Matchers.define :be_prime do

  match do |number|
    Prime.prime? number
  end

  failure_message_for_should do |number|
    "expected #{number} to be prime"
  end

  failure_message_for_should_not do |number|
    "expected #{number} not to be prime"
  end

  description do
    'be prime'
  end

end

describe 'be_prime' do

  # add here the logical tests, i.e. that the match logic works


  # and then check for the messages
  it 'should generate the correct failure message' do
    matcher = be_prime
    cache_messages_for_matcher(matcher, 10)
    matcher.should produce_as_failure_message 'expected 10 to be prime'
  end

  it 'should generate the correct negative failure message' do
    matcher = be_prime
    cache_messages_for_matcher(matcher, 7)
    matcher.should produce_as_negative_failure_message 'expected 7 not to be prime'
  end

  it 'should generate the correct description' do
    matcher = be_prime
    cache_messages_for_matcher(matcher, 0)
    matcher.should produce_as_description 'be prime'
  end

end