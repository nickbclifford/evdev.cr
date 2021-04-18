require "./enums"
require "./libevdev"

record Evdev::Event, time : Time, code : Evdev::Codes::All, value : Int32 do
  protected def self.from_lib(event : LibEvdev::InputEvent)
    time = Time.unix(event.time.tv_sec).shift(nanoseconds: event.time.tv_usec * 1000)
    code = Codes::TYPES[EventType.new(event.type.to_i)].new(event.code.to_i)
    new(time: time, code: code, value: event.value)
  end
end
