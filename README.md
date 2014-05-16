# Hash-o

Hash-o (pronounced Hash-Oh!) is a Ruby gem that provides a simple way for creating the `#to_h` methods in objects.
The `#to_h` is a standard interface added in Ruby 2.0 and it should return a hash representation of an object.


## Installation

Add this line to your application's Gemfile:

    gem 'hasho'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hasho

## Usage

Let's use a simple example to ilustrate the usage of hash-o:

```
class User
  include Hasho

  def name
    "John Smith"
  end

  def email
    "john@example.com"
  end
end

user = User.new
user.to_h

# => { name: "John Smith", email: "john@example.com" }
```

Hash-o works out of the box because, if no options are specified, it will reflect on the object's public interface and generate the hash based on it.

If for any reason you don't want to include all the object's public interface, you can specify which attributes will be included in the hash:

```
class User
  include Hasho
  
  hash_methods :name, :email

  def name
    "John Smith"
  end

  def email
    "john@example.com"
  end
  
  def password
    "superSecretOMG!"
  end
end

user = User.new
user.to_h

# => { name: "John Smith", email: "john@example.com" }
```
This is pretty much it, simple but effective.

## Todo

- [ ] Add an `:except` option to method call so user can tell which attributes **shouldn't** be added.
- [ ] Accept attributes (other than those already on the method interface) and add them as keys/values to the hash.
- [ ] Accept an attribute with an associated `Proc` and use result as the value on the hash.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hasho/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
