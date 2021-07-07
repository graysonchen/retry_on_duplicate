# RetryOnDuplicate

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/retry_on_duplicate`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'retry_on_duplicate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install retry_on_duplicate

## Usage

add db:migrate for a unique constraint at the database level 

```
add_index :users, :key, :email, unique: true
```

How to prevent duplicate database record creation

```
User.retry_on_duplicate do
  User.find_or_create_by(email: email)
end
```


## Problems Solved

- `ActiveRecord::RecordNotUnique: Mysql2::Error: Duplicate entry`

- `ActiveRecord::RecordNotUnique: PG::UniqueViolation: ERROR: duplicate key value violates unique constraint `


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/graysonchen/retry_on_duplicate.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
