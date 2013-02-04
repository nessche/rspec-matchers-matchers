require 'spec_helper'

module RSpec
  module Matchers
    module Custom
      module MatchersHelper

        describe 'get_message' do

          it 'should raise if the key is not supported' do
            expect{RSpec::Matchers::Custom::MatchersHelper.get_message(Object.new, :unsupported_key)}.to raise_error RuntimeError
          end

          it 'should add the @actual_messages variable if not already present in the matcher' do
            matcher = double(:matcher)
            matcher.stub(:description).and_return('Description')
            RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :description)
            matcher.instance_variable_get('@actual_messages').should_not be_nil
          end

          it 'should cache the value to @actual_messages, if not already present' do
            matcher = double(:matcher)
            matcher.should_receive(:description).once.and_return('Description')
            RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :description)
            matcher.instance_variable_get('@actual_messages').should have_key :description
          end

          it 'should reuse the cached value' do
            matcher = double(:matcher)
            matcher.should_receive(:description).once.and_return('Description')
            RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :description)
            RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :description)
          end

          it 'should get description from the matcher' do
            matcher = double(:matcher)
            matcher.should_receive(:description).once.and_return('Description')
            RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :description).should be_eql 'Description'
          end

          it 'should get failure_message from get_positive_failure_message' do
            matcher = double(:matcher)
            RSpec::Matchers::Custom::MatchersHelper.should_receive(:get_positive_failure_message).once.and_return('Failure Message')
            RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :failure_message_for_should).should be_eql 'Failure Message'
          end

          it 'should get the negative failure message get_negative_failure_message the helper' do
            matcher = double(:matcher)
            RSpec::Matchers::Custom::MatchersHelper.should_receive(:get_negative_failure_message).once.and_return('Negative Failure Message')
            RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :failure_message_for_should_not).should be_eql 'Negative Failure Message'
          end

        end

        describe 'get_positive_failure_message' do

          context 'when failure_message_for_should is supported' do

            it 'should invoke failure_message_for_should on the matcher' do
              matcher = double(:matcher)
              matcher.should_receive(:failure_message_for_should).once.and_return('Failure Message')
              matcher.should_not_receive(:failure_message)
              RSpec::Matchers::Custom::MatchersHelper.get_positive_failure_message(matcher).should be_eql 'Failure Message'
            end

          end

          context 'when failure_message_for_should is not supported' do

            it 'should invoke failure_message on the matcher' do
              matcher = double(:matcher)
              matcher.should_receive(:respond_to?).with(:failure_message_for_should).and_return false
              matcher.should_not_receive(:failure_message_for_should)
              matcher.should_receive(:failure_message).once.and_return('Failure Message')
              RSpec::Matchers::Custom::MatchersHelper.get_positive_failure_message(matcher).should be_eql 'Failure Message'
            end

          end

        end

        describe 'get_negative_failure_message' do

          context 'when failure_message_for_should_not is supported' do

            it 'should invoke failure_message_for_should on the matcher' do
              matcher = double(:matcher)
              matcher.should_receive(:failure_message_for_should_not).once.and_return('Negative Failure Message')
              matcher.should_not_receive(:negative_failure_message)
              RSpec::Matchers::Custom::MatchersHelper.get_negative_failure_message(matcher).should be_eql 'Negative Failure Message'
            end

          end

          context 'when failure_message_for_should is not supported' do

            it 'should invoke failure_message on the matcher' do
              matcher = double(:matcher)
              matcher.should_receive(:respond_to?).with(:failure_message_for_should_not).and_return false
              matcher.should_not_receive(:failure_message_for_should_not)
              matcher.should_receive(:negative_failure_message).once.and_return('Negative Failure Message')
              RSpec::Matchers::Custom::MatchersHelper.get_negative_failure_message(matcher).should be_eql 'Negative Failure Message'
            end

          end

        end

      end

    end

  end


end