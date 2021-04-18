require "errno"
require "./enums"
require "./error"
require "./event"
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
      with_dev(set_id_{{name.id}}, new_val)
    end
  {% end %}

  def driver_version
    with_dev(get_driver_version)
  end

  def has_property?(prop : InputProperty)
    with_dev(has_property, prop) == 1
  end

  def toggle_property(prop : InputProperty, enabled : Bool)
    if enabled
      try(enable_property, "Unable to enable property #{prop}", prop)
    else
      try(disable_property, "Unable to disable property #{prop}", prop)
    end
  end

  def has_event_type?(type : EventType)
    with_dev(has_event_type, type) == 1
  end

  def toggle_event_type(type : EventType, enabled : Bool)
    if enabled
      try(enable_event_type, "Unable to enable event type #{type}", type)
    else
      try(disable_event_type, "Unable to disable event type #{type}", type)
    end
  end

  def has_event_code?(code : Codes::All)
    with_dev(has_event_code, *pair(code)) == 1
  end

  def enable_event_code(code : Codes::Abs, info : LibEvdev::InputAbsinfo)
    try(enable_event_code, "Unable to enable event #{code.type} #{code}", *pair(code), Box.box(info))
  end

  def enable_event_code(code : Codes::Rep, data : Int32)
    try(enable_event_code, "Unable to enable event #{code.type} #{code}", *pair(code), Box.box(data))
  end

  def enable_event_code(code : Codes::All)
    try(enable_event_code, "Unable to enable event #{code.type} #{code}", *pair(code), Pointer(Void).null)
  end

  def disable_event_code(code : Codes::All)
    try(disable_event_code, "Unable to disable event #{code.type} #{type} #{code}", *pair(code))
  end

  {% for name in %w(minimum maximum fuzz flat resolution info) %}
    def axis_{{name.id}}(axis : Codes::Abs)
      with_dev(get_abs_{{name.id}}, axis)
    end

    def set_axis_{{name.id}}(axis : Codes::Abs, value)
      with_dev(set_abs_{{name.id}}, axis, value)
    end
  {% end %}

  def kernel_set_axis_info(axis : Codes::Abs, info)
    try_errno(kernel_set_abs_info, axis, info)
  end

  def set_led(code : Codes::Led, on : Bool)
    try_errno(kernel_set_led_value, code, on ? LibEvdev::LedValue::On : LibEvdev::LedValue::Off)
  end

  def set_clock_id(id)
    try_errno(set_clock_id, id)
  end

  # Gets the current value of an event, returns nil if the code is not supported by the device.
  def event_value?(code : Codes::All)
    if with_dev(fetch_event_value, *pair(code), out value) == 0
      value
    else
      nil
    end
  end

  # Gets the current value of an event, raises if the code is not supported by the device.
  def event_value(code : Codes::All)
    if value = event_value?(code)
      value
    else
      raise Error.new("Device does not support event #{code.type} #{code}")
    end
  end

  def set_event_value(code : Codes::All, value)
    try(set_event_value, "Unable to set event #{code.type} #{code} to #{value}", *pair(code), value)
  end

  def slot_value?(slot, code : Codes::Abs)
    if with_dev(fetch_slot_value, slot, code, out value) == 0
      value
    else
      nil
    end
  end

  def slot_value(slot, code : Codes::Abs)
    if value = slot_value?(code)
      value
    else
      raise Error.new("Device does not support slot #{slot} #{code}")
    end
  end

  def set_slot_value(slot, code : Codes::Abs, value)
    try(set_slot_value, "Unable to set slot #{slot} #{code} to #{value}", slot, code, value)
  end

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
      {Event.from_lib(event), LibEvdev::ReadStatus.new(val)}
    end
  end

  private macro pair(code)
    {code.type, code}
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
