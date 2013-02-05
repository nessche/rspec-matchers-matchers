# Rspec::Matchers::Matchers

[![Gem Version](https://badge.fury.io/rb/rspec-matchers-matchers.png)](http://badge.fury.io/rb/rspec-matchers-matchers)[![Build Status](https://travis-ci.org/nessche/rspec-matchers-matchers.png)](https://travis-ci.org/nessche/rspec-matchers-matchers)

An RSpec add on that lets you test your own custom matchers to make sure they generate the correct
failure messages and description message.

Why testing custom matchers?

If you are writing a library and plan to ship custom matchers that your library users can use in their specs, then you
should be testing your custom matchers as well to make sure that their fail/pass logic is correct and that the messages
they output provide meaninful information.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-matchers-matchers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-matchers-matchers

## Usage

The gem defines three custom matchers:

* `produce_as_failure_message`: used to check the message produced in case of a failed `should` statement
* `produce_as_negative_failure_message` used to check the message produced in case of failed `should_not` statement
* `produce_as_description`: used to check the message produced when outputting the description of the matcher

In order to use the matchers on your custom matcher, the custom matcher must be instantiated and "primed", or more precisely
the messages need to be cached for the produce_as_xxx to test them properly. Assuming you have developed a matcher called
`be prime` to check whether a number is prime

    my_number.should be_prime

One of your examples could look like this:

```ruby
 describe 'be_prime' do

    [...]

   # and then check for the messages
   it 'should generate the correct failure message' do
     # we instantiate the matcher. `be_prime` matcher do not take any block for the expected value, otherwise
     # you could specify it as usual after the matcher name (i.e. be_prime expected_value_block)
     matcher = be_prime
     # in the next line we assign the actual value to the matcher
     cache_messages_for_matcher(matcher, 10)
     # and finally we test that the produced message is what we expect it to be
     matcher.should produce_as_failure_message 'expected 10 to be prime'
   end

 end
```



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
