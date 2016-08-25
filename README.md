# Argument Specification

Using argspec, you can easily validate that arguments match your required specification.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'argspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install argspec

## Usage

Let's say you have the following ```Person``` class:

```ruby
class Person
  attr_reader :name, :gender, :birthdate

  def initialize(name, gender, birthdate)
    @name = name
    @gender = gender
    @birthdate = birthdate
  end
end
```

You'd like to validate those three arguments match the expected type. You might come up with something like this:

```ruby
class Person
  attr_reader :name, :gender, :birthdate

  def initialize(name, gender, birthdate)
    raise ArgumentError, 'The name must be a string and must not be nil.' if !name.is_a?(String) || name.empty?
    raise ArgumentError, 'The gender must be a symbol.' unless gender.is_a?(Symbol)
    raise ArgumentError, 'The birthdate must be a date.' unless birthdate.is_a?(Date)

    @name = name
    @gender = gender
    @birthdate = birthdate
  end
end
```

That will work fine, but it looks a little messy. Let's use argspec instead:

```ruby
class Person
  include ArgumentSpecification::DSL

  attr_reader :name, :gender, :birthdate

  def initialize(name, gender, birthdate)
    argument(name).should be_a(String)
    argument(gender).should be_a(Symbol)
    argument(birthdate).should be_a(Date)

    argument(name).should_not be_empty
    argument(gender).should_not be_empty

    @name = name
    @gender = gender
    @birthdate = birthdate
  end
end
```

That's better. It's now really clear what validations you're performing.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
