# Augmentations

*Augmentations* is a tiny gem to easily extend a class with instance methods and class methods, as well as running class methods like Rails `belongs_to` at extend time.

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-augmentations', require: 'augmentations'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-augmentations

And put a require statement into your code:

```ruby
require 'augmentations
```

# Usage

It's basically like `include`ing a module, but you can define class methods and call class methods as you would in the class itself, without (ab)using the `self.included` hook and thus with less boilerplate.

Use it for Rails like

    class User < ActiveRecord::Base
      augment Shared::Pingable, User::PasswordResetExtension
    end

with modules like

    module User::PasswordResetExtension
      augmentation do

        has_many :password_resets

        def self.a_class_method
          # …
        end

        def an_instance_method
          # …
        end

      end
    end

This particular module would be found in `app/models/user/password_reset_extension.rb`.

You may pass options to the augmentation as in the following example (taken from [henrik/augmentations.rb](https://gist.github.com/henrik/1281a6f3f6a9632886fa)):

    module MyMod
      augmentation do |excited: false|
        attr_accessor :this_works
        
        def self.class_method; "this works"; end
        def instance_method; "this works"; end
        
        # Parameters!
        if excited
          def self.hi
            puts "Hi!!!"
          end
        else
          def self.hi
            puts "Hi."
          end
        end
      end
    end
    
    class MyClass
      augment MyMod
    end
    
    class MyExcitedClass
      augment MyMod, excited: true
    end

## Credits

By [Henrik Nyh](http://henrik.nyh.se/) for [DanceJam](http://dancejam.com) under the MIT license:

Copyright (c) 2008 Henrik Nyh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
