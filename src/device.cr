require "errno"
require "./error"
require "./libevdev"

class Evdev::Device
  @device : LibEvdev::Device

  def self.from_file(file : IO::FileDescriptor)
    if LibEvdev.new_from_fd(file.fd, out dev) < 0
      raise Error.from_errno
    end
    new(dev)
  end

  def self.new
    new(LibEvdev.new)
  end

  private def initialize(@device)
    raise Error.from_errno if @device.null?
  end

  # For passing to uinput
  protected def to_unsafe
    @device
  end

  def finalize
    with_dev(free)
  end

  def fd
    with_dev(get_fd)
  end

  def fd=(fd)
    try_errno(set_fd, fd)
  end

  def grab(mode)
    try_errno(grab, mode)
  end

  {% for method, name in {name: "name", location: "phys", kernel_id: "uniq"} %}
    def {{method.id}}
      String.new(with_dev(get_{{name.id}}))
    end

    def {{method.id}}=(new_val)
      with_dev(set_{{name.id}}, new_val)
    end
  {% end %}

  {% for method, name in {product: "product", vendor: "vendor", bus_type: "bustype", firmware_version: "version"} %}
    def {{method.id}}
      with_dev(get_id_{{name.id}})
    end

    def {{method.id}}=(new_val)
      with_dev(set_id_{{name.id}})
    end
  {% end %}

  def driver_version
    with_dev(get_driver_version)
  end

  def has_property?(prop)
    with_dev(has_property, prop) == 1
  end

  def toggle_property(prop, enabled : Bool)
    if enabled
      try(enable_property, "Unable to enable property #{prop}", prop)
    else
      try(disable_property, "Unable to disable property #{prop}", prop)
    end
  end

  def has_event_type?(type)
    with_dev(has_event_type, type) == 1
  end

  def toggle_event_type(type, enabled : Bool)
    if enabled
      try(enable_event_type, "Unable to enable event type #{type}", type)
    else
      try(disable_event_type, "Unable to disable event type #{type}", type)
    end
  end

  def has_event_code?(type, code)
    with_dev(has_event_code, type, code) == 1
  end

  # TODO: enable event code

  def disable_event_code(type, code)
    try(disable_event_code, "Unable to disable event code #{type} #{code}", type, code)
  end

  {% for name in %w(minimum maximum fuzz flat resolution info) %}
    def axis_{{name.id}}(axis)
      with_dev(get_abs_{{name.id}}, axis)
    end

    def set_axis_{{name.id}}(axis, value)
      with_dev(set_abs_{{name.id}}, axis, value)
    end
  {% end %}

  def kernel_set_axis_info(axis, info)
    try_errno(kernel_set_abs_info, axis, info)
  end

  def set_led(code, on : Bool)
    try_errno(kernel_set_led_value, code, on ? LibEvdev::LedValue::On : LibEvdev::LedValue::Off)
  end

  def set_clock_id(id)
    try_errno(set_clock_id, id)
  end

  {% for kind, param in {event: "type", slot: "slot"} %}
    def {{kind.id}}_value?({{param.id}}, code)
      if with_dev(fetch_{{kind.id}}_value, {{param.id}}, code, out value) == 0
        value
      else
        nil
      end
    end

    def {{kind.id}}_value!({{param.id}}, code)
      if value = {{kind.id}}_value?({{param.id}}, code)
        value
      else
        raise Error.new("Device does not support {{kind.id}} #{{{param.id}}} #{code}")
      end
    end

    def set_{{kind.id}}_value({{param.id}}, code, value)
      try(set_{{kind.id}}_value, "Unable to set {{kind.id}} #{{{param.id}}} #{code} to #{value}", {{param.id}}, code, value)
    end
  {% end %}

  def num_slots
    with_dev(get_num_slots)
  end

  def current_slot
    with_dev(get_current_slot)
  end

  def event_pending?
    if (val = with_dev(has_event_pending)) < 0
      raise Error.from_errno
    else
      val == 1
    end
  end

  def next_event(flags)
    if (val = with_dev(next_event, flags, out event)) < 0
      raise Error.from_errno
    else
      LibEvdev::ReadStatus.new(val)
    end
  end

  private macro with_dev(method, *args)
    LibEvdev.{{method}}(@device, {{*args}})
  end

  private macro try(method, failure_msg, *args)
    if with_dev({{method}}, {{*args}}) < 0
      raise Error.new({{failure_msg}})
    end
  end

  private macro try_errno(method, *args)
    try({{method}}, Errno.value.message, {{*args}})
  end
end
