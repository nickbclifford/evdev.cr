require "./device"
require "./enums"
require "./error"
require "./libevdev"

class Evdev::UinputDevice
  @uinput : LibEvdev::Uinput

  # Creates a new uinput device from a `Device` and an open file handle to `/dev/uinput`.
  # If `file` is `nil`, libevdev will automatically create and manage its own uinput handle.
  def initialize(device : Device, file : IO::FileDescriptor? = nil)
    if LibEvdev.uinput_create_from_device(device, file.try(&.fd) || LibEvdev::UINPUT_OPEN_MANAGED, out @uinput) < 0
      raise Error.from_errno
    end
  end

  def finalize
    with_dev(destroy)
  end

  def fd
    with_dev(get_fd)
  end

  def syspath
    String.new(with_dev(get_syspath))
  end

  def device_node
    String.new(with_dev(get_devnode))
  end

  def write_event(code : Codes::All, value)
    if with_dev(write_event, code.type, code, value) < 0
      raise Error.from_errno
    end
  end

  private macro with_dev(method, *args)
    LibEvdev.uinput_{{method}}(@uinput, {{*args}})
  end
end
