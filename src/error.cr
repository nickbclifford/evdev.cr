require "errno"

class Evdev::Error < Exception
  protected def self.from_errno
    new Errno.value.message
  end
end
