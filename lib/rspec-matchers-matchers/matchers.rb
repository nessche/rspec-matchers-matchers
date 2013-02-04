
def cache_messages_for_matcher(matcher, actual)
  matcher.instance_variable_set('@actual', actual)
  RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :failure_message_for_should)
  RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :failure_message_for_should_not)
  RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :description)
end

RSpec::Matchers.define :produce_as_failure_message do |expected_message|

  match do |matcher|
    RSpec::Matchers::Custom::MatchersHelper.match_message(RSpec::Matchers::Custom::MatchersHelper.get_message(matcher,:failure_message_for_should), expected_message)
  end

  failure_message_for_should do |matcher|
    "matcher #{matcher.name} should have produced \"#{expected_message}\" as failure message, " +
        "but instead it emitted \"#{RSpec::Matchers::Custom::MatchersHelper.get_message(matcher,:failure_message_for_should)}\""
  end

  failure_message_for_should_not do |matcher|
    "matcher #{matcher.name} should not have produced \"#{expected_message}\" as failure message"
  end

  description do
    "produce failure message \"#{expected_message}\""
  end

end

RSpec::Matchers.define :produce_as_negative_failure_message do |expected_message|

  match do |matcher|
    RSpec::Matchers::Custom::MatchersHelper.match_message(RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :failure_message_for_should_not), expected_message)
  end

  failure_message_for_should do |matcher|
    "matcher #{matcher.name} should have produced \"#{expected_message}\" as negative failure message, " +
        "but instead it emitted \"#{RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :failure_message_for_should_not)}\""
  end

  failure_message_for_should_not do |matcher|
    "matcher #{matcher.name} should not have produced \"#{expected_message}\" as negative failure message"
  end

  description do
    "produce negative failure message \"#{expected_message}\""
  end

end

RSpec::Matchers.define :produce_as_description do |expected_message|

  match do |matcher|
    RSpec::Matchers::Custom::MatchersHelper.match_message(RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :description), expected_message)
  end

  failure_message_for_should do |matcher|
    "matcher #{matcher.name} should have produced \"#{expected_message}\" as description, " +
        "but instead it emitted \"#{RSpec::Matchers::Custom::MatchersHelper.get_message(matcher, :description)}\""
  end

  failure_message_for_should_not do |matcher|
    "matcher #{matcher.name} should not have produced \"#{expected_message}\" as description"
  end

  description do
    "produce expected description \"#{expected_message}\""
  end

end
