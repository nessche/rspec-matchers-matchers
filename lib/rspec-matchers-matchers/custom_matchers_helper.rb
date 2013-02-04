module RSpec
  module Matchers
    module Custom
      module MatchersHelper

        def self.get_message(matcher, key)
          actual_messages = matcher.instance_variable_get('@actual_messages')
          if actual_messages.nil?
            actual_messages = Hash.new
            matcher.instance_variable_set('@actual_messages',actual_messages)
          end
          unless actual_messages.has_key? key
            case key
              when :failure_message_for_should
                message = get_positive_failure_message matcher
              when :failure_message_for_should_not
                message = get_negative_failure_message matcher
              when :description
                message = matcher.description
              else
                message = nil
            end
            actual_messages[key] = message
          end
          actual_messages[key]
        end

        def self.get_positive_failure_message(matcher)
            matcher.respond_to?(:failure_message_for_should) ?
              matcher.failure_message_for_should :
              matcher.failure_message
        end

        def self.get_negative_failure_message(matcher)
          matcher.respond_to?(:failure_message_for_should_not) ?
            matcher.failure_message_for_should_not :
            matcher.negative_failure_message
        end

        def self.match_message(actual_message, expected_message)
          # the method is simple, but we use it so we can stub it out if need be
          actual_message.eql? expected_message
        end
      end
    end
  end
end