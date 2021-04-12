@[Link("evdev")]
lib LibEvdev
  type Device = Void*
  type Uinput = Void*

  alias DeviceLogFuncT = (Device, LogPriority, Void*, LibC::Char*, LibC::Int, LibC::Char*, LibC::Char*, LibC::VaList -> Void)
  alias LogFuncT = (LogPriority, Void*, LibC::Char*, LibC::Int, LibC::Char*, LibC::Char*, LibC::VaList -> Void)

  enum GrabMode
    Grab   = 3
    Ungrab = 4
  end
  enum LedValue
    On  = 3
    Off = 4
  end
  enum LogPriority
    Error = 10
    Info  = 20
    Debug = 30
  end

  fun change_fd = libevdev_change_fd(dev : Device, fd : LibC::Int) : LibC::Int
  fun disable_event_code = libevdev_disable_event_code(dev : Device, type : LibC::UInt, code : LibC::UInt) : LibC::Int
  fun disable_event_type = libevdev_disable_event_type(dev : Device, type : LibC::UInt) : LibC::Int
  fun disable_property = libevdev_disable_property(dev : Device, prop : LibC::UInt) : LibC::Int
  fun enable_event_code = libevdev_enable_event_code(dev : Device, type : LibC::UInt, code : LibC::UInt, data : Void*) : LibC::Int
  fun enable_event_type = libevdev_enable_event_type(dev : Device, type : LibC::UInt) : LibC::Int
  fun enable_property = libevdev_enable_property(dev : Device, prop : LibC::UInt) : LibC::Int
  fun event_code_from_code_name = libevdev_event_code_from_code_name(name : LibC::Char*) : LibC::Int
  fun event_code_from_code_name_n = libevdev_event_code_from_code_name_n(name : LibC::Char*, len : LibC::SizeT) : LibC::Int
  fun event_code_from_name = libevdev_event_code_from_name(type : LibC::UInt, name : LibC::Char*) : LibC::Int
  fun event_code_from_name_n = libevdev_event_code_from_name_n(type : LibC::UInt, name : LibC::Char*, len : LibC::SizeT) : LibC::Int
  fun event_code_get_name = libevdev_event_code_get_name(type : LibC::UInt, code : LibC::UInt) : LibC::Char*
  fun event_is_code = libevdev_event_is_code(ev : InputEvent*, type : LibC::UInt, code : LibC::UInt) : LibC::Int
  fun event_is_type = libevdev_event_is_type(ev : InputEvent*, type : LibC::UInt) : LibC::Int
  fun event_type_from_code_name = libevdev_event_type_from_code_name(name : LibC::Char*) : LibC::Int
  fun event_type_from_code_name_n = libevdev_event_type_from_code_name_n(name : LibC::Char*, len : LibC::SizeT) : LibC::Int
  fun event_type_from_name = libevdev_event_type_from_name(name : LibC::Char*) : LibC::Int
  fun event_type_from_name_n = libevdev_event_type_from_name_n(name : LibC::Char*, len : LibC::SizeT) : LibC::Int
  fun event_type_get_max = libevdev_event_type_get_max(type : LibC::UInt) : LibC::Int
  fun event_type_get_name = libevdev_event_type_get_name(type : LibC::UInt) : LibC::Char*
  fun event_value_from_name = libevdev_event_value_from_name(type : LibC::UInt, code : LibC::UInt, name : LibC::Char*) : LibC::Int
  fun event_value_from_name_n = libevdev_event_value_from_name_n(type : LibC::UInt, code : LibC::UInt, name : LibC::Char*, len : LibC::SizeT) : LibC::Int
  fun event_value_get_name = libevdev_event_value_get_name(type : LibC::UInt, code : LibC::UInt, value : LibC::Int) : LibC::Char*
  fun fetch_event_value = libevdev_fetch_event_value(dev : Device, type : LibC::UInt, code : LibC::UInt, value : LibC::Int*) : LibC::Int
  fun fetch_slot_value = libevdev_fetch_slot_value(dev : Device, slot : LibC::UInt, code : LibC::UInt, value : LibC::Int*) : LibC::Int
  fun free = libevdev_free(dev : Device)
  fun get_abs_flat = libevdev_get_abs_flat(dev : Device, code : LibC::UInt) : LibC::Int
  fun get_abs_fuzz = libevdev_get_abs_fuzz(dev : Device, code : LibC::UInt) : LibC::Int
  fun get_abs_info = libevdev_get_abs_info(dev : Device, code : LibC::UInt) : InputAbsinfo*
  fun get_abs_maximum = libevdev_get_abs_maximum(dev : Device, code : LibC::UInt) : LibC::Int
  fun get_abs_minimum = libevdev_get_abs_minimum(dev : Device, code : LibC::UInt) : LibC::Int
  fun get_abs_resolution = libevdev_get_abs_resolution(dev : Device, code : LibC::UInt) : LibC::Int
  fun get_current_slot = libevdev_get_current_slot(dev : Device) : LibC::Int
  fun get_driver_version = libevdev_get_driver_version(dev : Device) : LibC::Int
  fun get_event_value = libevdev_get_event_value(dev : Device, type : LibC::UInt, code : LibC::UInt) : LibC::Int
  fun get_fd = libevdev_get_fd(dev : Device) : LibC::Int
  fun get_id_bustype = libevdev_get_id_bustype(dev : Device) : LibC::Int
  fun get_id_product = libevdev_get_id_product(dev : Device) : LibC::Int
  fun get_id_vendor = libevdev_get_id_vendor(dev : Device) : LibC::Int
  fun get_id_version = libevdev_get_id_version(dev : Device) : LibC::Int
  fun get_log_priority = libevdev_get_log_priority : LogPriority
  fun get_name = libevdev_get_name(dev : Device) : LibC::Char*
  fun get_num_slots = libevdev_get_num_slots(dev : Device) : LibC::Int
  fun get_phys = libevdev_get_phys(dev : Device) : LibC::Char*
  fun get_repeat = libevdev_get_repeat(dev : Device, delay : LibC::Int*, period : LibC::Int*) : LibC::Int
  fun get_slot_value = libevdev_get_slot_value(dev : Device, slot : LibC::UInt, code : LibC::UInt) : LibC::Int
  fun get_uniq = libevdev_get_uniq(dev : Device) : LibC::Char*
  fun grab = libevdev_grab(dev : Device, grab : GrabMode) : LibC::Int
  fun has_event_code = libevdev_has_event_code(dev : Device, type : LibC::UInt, code : LibC::UInt) : LibC::Int
  fun has_event_pending = libevdev_has_event_pending(dev : Device) : LibC::Int
  fun has_event_type = libevdev_has_event_type(dev : Device, type : LibC::UInt) : LibC::Int
  fun has_property = libevdev_has_property(dev : Device, prop : LibC::UInt) : LibC::Int
  fun kernel_set_abs_info = libevdev_kernel_set_abs_info(dev : Device, code : LibC::UInt, abs : InputAbsinfo*) : LibC::Int
  fun kernel_set_led_value = libevdev_kernel_set_led_value(dev : Device, code : LibC::UInt, value : LedValue) : LibC::Int
  fun kernel_set_led_values = libevdev_kernel_set_led_values(dev : Device, ...) : LibC::Int
  fun new = libevdev_new : Device
  fun new_from_fd = libevdev_new_from_fd(fd : LibC::Int, dev : Device*) : LibC::Int
  fun next_event = libevdev_next_event(dev : Device, flags : LibC::UInt, ev : InputEvent*) : LibC::Int
  fun property_from_name = libevdev_property_from_name(name : LibC::Char*) : LibC::Int
  fun property_from_name_n = libevdev_property_from_name_n(name : LibC::Char*, len : LibC::SizeT) : LibC::Int
  fun property_get_name = libevdev_property_get_name(prop : LibC::UInt) : LibC::Char*
  fun set_abs_flat = libevdev_set_abs_flat(dev : Device, code : LibC::UInt, val : LibC::Int)
  fun set_abs_fuzz = libevdev_set_abs_fuzz(dev : Device, code : LibC::UInt, val : LibC::Int)
  fun set_abs_info = libevdev_set_abs_info(dev : Device, code : LibC::UInt, abs : InputAbsinfo*)
  fun set_abs_maximum = libevdev_set_abs_maximum(dev : Device, code : LibC::UInt, val : LibC::Int)
  fun set_abs_minimum = libevdev_set_abs_minimum(dev : Device, code : LibC::UInt, val : LibC::Int)
  fun set_abs_resolution = libevdev_set_abs_resolution(dev : Device, code : LibC::UInt, val : LibC::Int)
  fun set_clock_id = libevdev_set_clock_id(dev : Device, clockid : LibC::Int) : LibC::Int
  fun set_device_log_function = libevdev_set_device_log_function(dev : Device, logfunc : DeviceLogFuncT, priority : LogPriority, data : Void*)
  fun set_event_value = libevdev_set_event_value(dev : Device, type : LibC::UInt, code : LibC::UInt, value : LibC::Int) : LibC::Int
  fun set_fd = libevdev_set_fd(dev : Device, fd : LibC::Int) : LibC::Int
  fun set_id_bustype = libevdev_set_id_bustype(dev : Device, bustype : LibC::Int)
  fun set_id_product = libevdev_set_id_product(dev : Device, product_id : LibC::Int)
  fun set_id_vendor = libevdev_set_id_vendor(dev : Device, vendor_id : LibC::Int)
  fun set_id_version = libevdev_set_id_version(dev : Device, version : LibC::Int)
  fun set_log_function = libevdev_set_log_function(logfunc : LogFuncT, data : Void*)
  fun set_log_priority = libevdev_set_log_priority(priority : LogPriority)
  fun set_name = libevdev_set_name(dev : Device, name : LibC::Char*)
  fun set_phys = libevdev_set_phys(dev : Device, phys : LibC::Char*)
  fun set_slot_value = libevdev_set_slot_value(dev : Device, slot : LibC::UInt, code : LibC::UInt, value : LibC::Int) : LibC::Int
  fun set_uniq = libevdev_set_uniq(dev : Device, uniq : LibC::Char*)

  UINPUT_OPEN_MANAGED = -2

  fun uinput_create_from_device = libevdev_uinput_create_from_device(dev : Device, uinput_fd : LibC::Int, uinput_dev : Uinput*) : LibC::Int
  fun uinput_destroy = libevdev_uinput_destroy(uinput_dev : Uinput)
  fun uinput_get_devnode = libevdev_uinput_get_devnode(uinput_dev : Uinput) : LibC::Char*
  fun uinput_get_fd = libevdev_uinput_get_fd(uinput_dev : Uinput) : LibC::Int
  fun uinput_get_syspath = libevdev_uinput_get_syspath(uinput_dev : Uinput) : LibC::Char*
  fun uinput_write_event = libevdev_uinput_write_event(uinput_dev : Uinput, type : LibC::UInt, code : LibC::UInt, value : LibC::Int) : LibC::Int

  struct InputAbsinfo
    value : Int32
    minimum : Int32
    maximum : Int32
    fuzz : Int32
    flat : Int32
    resolution : Int32
  end

  struct InputEvent
    time : Timeval
    type : UInt16
    code : UInt16
    value : Int32
  end

  alias SUsecondsT = LibC::Long
  alias TimeT = LibC::Long

  struct Timeval
    tv_sec : TimeT
    tv_usec : SUsecondsT
  end
end
