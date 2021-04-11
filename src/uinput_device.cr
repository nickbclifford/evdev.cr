require "errno"
require "./device"
require "./error"
require "./libevdev"

class Evdev::UinputDevice
  @uinput : LibEvdev::Uinput

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

  def write_event(type, code, value)
    if with_dev(write_event, type, code, value) < 0
      raise Error.from_errno
    end
  end

  private macro with_dev(method, *args)
    LibEvdev.uinput_{{method}}(@uinput, {{*args}})
  end
end
