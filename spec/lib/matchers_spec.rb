require 'spec_helper'

describe "Matchers matchers" do

  before do
    @inner_matcher = double(:inner_matcher)
    @inner_matcher.stub(:name).and_return('my_stubbed_matcher')
    @inner_matcher.stub(:failure_message_for_should).and_return('The positive failure message')
    @inner_matcher.stub(:failure_message_for_should_not).and_return('The negative failure message')
    @inner_matcher.stub(:description).and_return('The description message')
  end

  describe 'produce_as_failure_message' do

    it 'should produce the correct message as positive failure message' do
      expected_message = 'matcher my_stubbed_matcher should have produced "The wrong type of message" as failure message, but instead it emitted "The positive failure message"'
      matcher = produce_as_failure_message 'The wrong type of message'
      cache_messages_for_matcher(matcher, @inner_matcher)
      matcher.should produce_as_failure_message expected_message
    end

    it 'should produce the correct message as negative failure message' do
      expected_message = 'matcher my_stubbed_matcher should not have produced "The positive failure message" as failure message'
      matcher = produce_as_failure_message 'The positive failure message'
      cache_messages_for_matcher(matcher, @inner_matcher)
      matcher.should produce_as_negative_failure_message expected_message
    end

    it 'should produce the correct description' do
      expected_message = 'produce failure message "The expected fail message"'
      matcher = produce_as_failure_message 'The expected fail message'
      cache_messages_for_matcher(matcher, @inner_matcher)
      matcher.should produce_as_description expected_message
    end

  end

  describe 'produce_as_negative_failure_message' do

    it 'should produce the correct message as positive failure message' do
      expected_message = 'matcher my_stubbed_matcher should have produced "The wrong type of message" as negative failure message, but instead it emitted "The negative failure message"'
      matcher = produce_as_negative_failure_message 'The wrong type of message'
      cache_messages_for_matcher(matcher, @inner_matcher)
      matcher.should produce_as_failure_message expected_message
    end

    it 'should produce the correct message as negative failure message' do
      expected_message = 'matcher my_stubbed_matcher should not have produced "The negative failure message" as negative failure message'
      matcher = produce_as_negative_failure_message 'The negative failure message'
      cache_messages_for_matcher(matcher, @inner_matcher)
      matcher.should produce_as_negative_failure_message expected_message
    end

    it 'should produce the correct description' do
      expected_message = 'produce negative failure message "The expected fail message"'
      matcher = produce_as_negative_failure_message 'The expected fail message'
      cache_messages_for_matcher(matcher, @inner_matcher)
      matcher.should produce_as_description expected_message
    end


  end

  describe 'produce_as_description' do

    it 'should produce the correct message as positive failure message' do
      expected_message = 'matcher my_stubbed_matcher should have produced "The wrong description" as description, but instead it emitted "The description message"'
      matcher = produce_as_description 'The wrong description'
      cache_messages_for_matcher(matcher, @inner_matcher)
      matcher.should produce_as_failure_message expected_message
    end

    it 'should produce the correct message as negative failure message' do
      expected_message = 'matcher my_stubbed_matcher should not have produced "The description message" as description'
      matcher = produce_as_description 'The description message'
      cache_messages_for_matcher(matcher, @inner_matcher)
      matcher.should produce_as_negative_failure_message expected_message
    end

    it 'should produce the correct description' do
      expected_message = 'produce expected description "The description message"'
      matcher = produce_as_description 'The description message'
      cache_messages_for_matcher(matcher, @inner_matcher)
      matcher.should produce_as_description expected_message
    end


  end

end