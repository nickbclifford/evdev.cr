# evdev.cr

Crystal bindings to [libevdev](https://www.freedesktop.org/wiki/Software/libevdev/).

[**API Documentation**](https://nickbclifford.github.io/evdev.cr/)

## Documentation

As these bindings are effectively just a wrapper (i.e. minimal abstraction), behavior is identical to that described in the
[libevdev docs](https://www.freedesktop.org/software/libevdev/doc/latest/index.html) unless otherwise specified.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     evdev:
       github: nickbclifford/evdev.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "evdev"

File.open("/dev/input/event0") do |file|
  device = Evdev::Device.from_file(file)
  puts device.name
end
```

## Contributing

1. Fork it (<https://github.com/nickbclifford/evdev.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Nick Clifford](https://github.com/nickbclifford) - creator and maintainer
