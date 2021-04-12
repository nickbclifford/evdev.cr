module Evdev
  enum EventType
    Syn      = 0x00
    Key      = 0x01
    Rel      = 0x02
    Abs      = 0x03
    Msc      = 0x04
    Sw       = 0x05
    Led      = 0x11
    Snd      = 0x12
    Rep      = 0x14
    Ff       = 0x15
    Pwr      = 0x16
    FfStatus = 0x17
  end

  enum InputProperty
    Pointer       = 0x00
    Direct        = 0x01
    Buttonpad     = 0x02
    SemiMt        = 0x03
    Topbuttonpad  = 0x04
    PointingStick = 0x05
    Accelerometer = 0x06
  end

  module Codes
    macro finished
      alias All = Union({{*@type.constants}})
    end

    # Auto-generated from linux/input.h and linux/input-event-codes.h

    enum Syn
      Report   = 0
      Config   = 1
      MtReport = 2
      Dropped  = 3

      def type
        EventType::Syn
      end
    end

    # Enum members cannot start with a number, so any members that otherwise would have Key prepended.
    enum Key
      Reserved                =   0
      Esc                     =   1
      Key1                    =   2
      Key2                    =   3
      Key3                    =   4
      Key4                    =   5
      Key5                    =   6
      Key6                    =   7
      Key7                    =   8
      Key8                    =   9
      Key9                    =  10
      Key0                    =  11
      Minus                   =  12
      Equal                   =  13
      Backspace               =  14
      Tab                     =  15
      Q                       =  16
      W                       =  17
      E                       =  18
      R                       =  19
      T                       =  20
      Y                       =  21
      U                       =  22
      I                       =  23
      O                       =  24
      P                       =  25
      Leftbrace               =  26
      Rightbrace              =  27
      Enter                   =  28
      Leftctrl                =  29
      A                       =  30
      S                       =  31
      D                       =  32
      F                       =  33
      G                       =  34
      H                       =  35
      J                       =  36
      K                       =  37
      L                       =  38
      Semicolon               =  39
      Apostrophe              =  40
      Grave                   =  41
      Leftshift               =  42
      Backslash               =  43
      Z                       =  44
      X                       =  45
      C                       =  46
      V                       =  47
      B                       =  48
      N                       =  49
      M                       =  50
      Comma                   =  51
      Dot                     =  52
      Slash                   =  53
      Rightshift              =  54
      Kpasterisk              =  55
      Leftalt                 =  56
      Space                   =  57
      Capslock                =  58
      F1                      =  59
      F2                      =  60
      F3                      =  61
      F4                      =  62
      F5                      =  63
      F6                      =  64
      F7                      =  65
      F8                      =  66
      F9                      =  67
      F10                     =  68
      Numlock                 =  69
      Scrolllock              =  70
      Kp7                     =  71
      Kp8                     =  72
      Kp9                     =  73
      Kpminus                 =  74
      Kp4                     =  75
      Kp5                     =  76
      Kp6                     =  77
      Kpplus                  =  78
      Kp1                     =  79
      Kp2                     =  80
      Kp3                     =  81
      Kp0                     =  82
      Kpdot                   =  83
      Zenkakuhankaku          =  85
      Key102nd                =  86
      F11                     =  87
      F12                     =  88
      Ro                      =  89
      Katakana                =  90
      Hiragana                =  91
      Henkan                  =  92
      Katakanahiragana        =  93
      Muhenkan                =  94
      Kpjpcomma               =  95
      Kpenter                 =  96
      Rightctrl               =  97
      Kpslash                 =  98
      Sysrq                   =  99
      Rightalt                = 100
      Linefeed                = 101
      Home                    = 102
      Up                      = 103
      Pageup                  = 104
      Left                    = 105
      Right                   = 106
      End                     = 107
      Down                    = 108
      Pagedown                = 109
      Insert                  = 110
      Delete                  = 111
      Macro                   = 112
      Mute                    = 113
      Volumedown              = 114
      Volumeup                = 115
      Power                   = 116
      Kpequal                 = 117
      Kpplusminus             = 118
      Pause                   = 119
      Scale                   = 120
      Kpcomma                 = 121
      Hangeul                 = 122
      Hanguel                 = Hangeul
      Hanja                   = 123
      Yen                     = 124
      Leftmeta                = 125
      Rightmeta               = 126
      Compose                 = 127
      Stop                    = 128
      Again                   = 129
      Props                   = 130
      Undo                    = 131
      Front                   = 132
      Copy                    = 133
      Open                    = 134
      Paste                   = 135
      Find                    = 136
      Cut                     = 137
      Help                    = 138
      Menu                    = 139
      Calc                    = 140
      Setup                   = 141
      Sleep                   = 142
      Wakeup                  = 143
      File                    = 144
      Sendfile                = 145
      Deletefile              = 146
      Xfer                    = 147
      Prog1                   = 148
      Prog2                   = 149
      Www                     = 150
      Msdos                   = 151
      Coffee                  = 152
      Screenlock              = Coffee
      RotateDisplay           = 153
      Direction               = RotateDisplay
      Cyclewindows            = 154
      Mail                    = 155
      Bookmarks               = 156
      Computer                = 157
      Back                    = 158
      Forward                 = 159
      Closecd                 = 160
      Ejectcd                 = 161
      Ejectclosecd            = 162
      Nextsong                = 163
      Playpause               = 164
      Previoussong            = 165
      Stopcd                  = 166
      Record                  = 167
      Rewind                  = 168
      Phone                   = 169
      Iso                     = 170
      Config                  = 171
      Homepage                = 172
      Refresh                 = 173
      Exit                    = 174
      Move                    = 175
      Edit                    = 176
      Scrollup                = 177
      Scrolldown              = 178
      Kpleftparen             = 179
      Kprightparen            = 180
      New                     = 181
      Redo                    = 182
      F13                     = 183
      F14                     = 184
      F15                     = 185
      F16                     = 186
      F17                     = 187
      F18                     = 188
      F19                     = 189
      F20                     = 190
      F21                     = 191
      F22                     = 192
      F23                     = 193
      F24                     = 194
      Playcd                  = 200
      Pausecd                 = 201
      Prog3                   = 202
      Prog4                   = 203
      Dashboard               = 204
      Suspend                 = 205
      Close                   = 206
      Play                    = 207
      Fastforward             = 208
      Bassboost               = 209
      Print                   = 210
      Hp                      = 211
      Camera                  = 212
      Sound                   = 213
      Question                = 214
      Email                   = 215
      Chat                    = 216
      Search                  = 217
      Connect                 = 218
      Finance                 = 219
      Sport                   = 220
      Shop                    = 221
      Alterase                = 222
      Cancel                  = 223
      Brightnessdown          = 224
      Brightnessup            = 225
      Media                   = 226
      Switchvideomode         = 227
      Kbdillumtoggle          = 228
      Kbdillumdown            = 229
      Kbdillumup              = 230
      Send                    = 231
      Reply                   = 232
      Forwardmail             = 233
      Save                    = 234
      Documents               = 235
      Battery                 = 236
      Bluetooth               = 237
      Wlan                    = 238
      Uwb                     = 239
      Unknown                 = 240
      VideoNext               = 241
      VideoPrev               = 242
      BrightnessCycle         = 243
      BrightnessAuto          = 244
      BrightnessZero          = BrightnessAuto
      DisplayOff              = 245
      Wwan                    = 246
      Wimax                   = Wwan
      Rfkill                  =   247
      Micmute                 =   248
      BtnMisc                 = 0x100
      Btn0                    = 0x100
      Btn1                    = 0x101
      Btn2                    = 0x102
      Btn3                    = 0x103
      Btn4                    = 0x104
      Btn5                    = 0x105
      Btn6                    = 0x106
      Btn7                    = 0x107
      Btn8                    = 0x108
      Btn9                    = 0x109
      BtnMouse                = 0x110
      BtnLeft                 = 0x110
      BtnRight                = 0x111
      BtnMiddle               = 0x112
      BtnSide                 = 0x113
      BtnExtra                = 0x114
      BtnForward              = 0x115
      BtnBack                 = 0x116
      BtnTask                 = 0x117
      BtnJoystick             = 0x120
      BtnTrigger              = 0x120
      BtnThumb                = 0x121
      BtnThumb2               = 0x122
      BtnTop                  = 0x123
      BtnTop2                 = 0x124
      BtnPinkie               = 0x125
      BtnBase                 = 0x126
      BtnBase2                = 0x127
      BtnBase3                = 0x128
      BtnBase4                = 0x129
      BtnBase5                = 0x12a
      BtnBase6                = 0x12b
      BtnDead                 = 0x12f
      BtnGamepad              = 0x130
      BtnSouth                = 0x130
      BtnA                    = BtnSouth
      BtnEast                 = 0x131
      BtnB                    = BtnEast
      BtnC                    = 0x132
      BtnNorth                = 0x133
      BtnX                    = BtnNorth
      BtnWest                 = 0x134
      BtnY                    = BtnWest
      BtnZ                    = 0x135
      BtnTl                   = 0x136
      BtnTr                   = 0x137
      BtnTl2                  = 0x138
      BtnTr2                  = 0x139
      BtnSelect               = 0x13a
      BtnStart                = 0x13b
      BtnMode                 = 0x13c
      BtnThumbl               = 0x13d
      BtnThumbr               = 0x13e
      BtnDigi                 = 0x140
      BtnToolPen              = 0x140
      BtnToolRubber           = 0x141
      BtnToolBrush            = 0x142
      BtnToolPencil           = 0x143
      BtnToolAirbrush         = 0x144
      BtnToolFinger           = 0x145
      BtnToolMouse            = 0x146
      BtnToolLens             = 0x147
      BtnToolQuinttap         = 0x148
      BtnStylus3              = 0x149
      BtnTouch                = 0x14a
      BtnStylus               = 0x14b
      BtnStylus2              = 0x14c
      BtnToolDoubletap        = 0x14d
      BtnToolTripletap        = 0x14e
      BtnToolQuadtap          = 0x14f
      BtnWheel                = 0x150
      BtnGearDown             = 0x150
      BtnGearUp               = 0x151
      Ok                      = 0x160
      Select                  = 0x161
      Goto                    = 0x162
      Clear                   = 0x163
      Power2                  = 0x164
      Option                  = 0x165
      Info                    = 0x166
      Time                    = 0x167
      Vendor                  = 0x168
      Archive                 = 0x169
      Program                 = 0x16a
      Channel                 = 0x16b
      Favorites               = 0x16c
      Epg                     = 0x16d
      Pvr                     = 0x16e
      Mhp                     = 0x16f
      Language                = 0x170
      Title                   = 0x171
      Subtitle                = 0x172
      Angle                   = 0x173
      FullScreen              = 0x174
      Zoom                    = FullScreen
      Mode                    = 0x175
      Keyboard                = 0x176
      AspectRatio             = 0x177
      Screen                  = AspectRatio
      Pc                      = 0x178
      Tv                      = 0x179
      Tv2                     = 0x17a
      Vcr                     = 0x17b
      Vcr2                    = 0x17c
      Sat                     = 0x17d
      Sat2                    = 0x17e
      Cd                      = 0x17f
      Tape                    = 0x180
      Radio                   = 0x181
      Tuner                   = 0x182
      Player                  = 0x183
      Text                    = 0x184
      Dvd                     = 0x185
      Aux                     = 0x186
      Mp3                     = 0x187
      Audio                   = 0x188
      Video                   = 0x189
      Directory               = 0x18a
      List                    = 0x18b
      Memo                    = 0x18c
      Calendar                = 0x18d
      Red                     = 0x18e
      Green                   = 0x18f
      Yellow                  = 0x190
      Blue                    = 0x191
      Channelup               = 0x192
      Channeldown             = 0x193
      First                   = 0x194
      Last                    = 0x195
      Ab                      = 0x196
      Next                    = 0x197
      Restart                 = 0x198
      Slow                    = 0x199
      Shuffle                 = 0x19a
      Break                   = 0x19b
      Previous                = 0x19c
      Keys                    = 0x19d
      Teen                    = 0x19e
      Twen                    = 0x19f
      Videophone              = 0x1a0
      Games                   = 0x1a1
      Zoomin                  = 0x1a2
      Zoomout                 = 0x1a3
      Zoomreset               = 0x1a4
      Wordprocessor           = 0x1a5
      Editor                  = 0x1a6
      Spreadsheet             = 0x1a7
      Graphicseditor          = 0x1a8
      Presentation            = 0x1a9
      Database                = 0x1aa
      News                    = 0x1ab
      Voicemail               = 0x1ac
      Addressbook             = 0x1ad
      Messenger               = 0x1ae
      Displaytoggle           = 0x1af
      BrightnessToggle        = Displaytoggle
      Spellcheck              = 0x1b0
      Logoff                  = 0x1b1
      Dollar                  = 0x1b2
      Euro                    = 0x1b3
      Frameback               = 0x1b4
      Frameforward            = 0x1b5
      ContextMenu             = 0x1b6
      MediaRepeat             = 0x1b7
      Key10channelsup         = 0x1b8
      Key10channelsdown       = 0x1b9
      Images                  = 0x1ba
      NotificationCenter      = 0x1bc
      PickupPhone             = 0x1bd
      HangupPhone             = 0x1be
      DelEol                  = 0x1c0
      DelEos                  = 0x1c1
      InsLine                 = 0x1c2
      DelLine                 = 0x1c3
      Fn                      = 0x1d0
      FnEsc                   = 0x1d1
      FnF1                    = 0x1d2
      FnF2                    = 0x1d3
      FnF3                    = 0x1d4
      FnF4                    = 0x1d5
      FnF5                    = 0x1d6
      FnF6                    = 0x1d7
      FnF7                    = 0x1d8
      FnF8                    = 0x1d9
      FnF9                    = 0x1da
      FnF10                   = 0x1db
      FnF11                   = 0x1dc
      FnF12                   = 0x1dd
      Fn1                     = 0x1de
      Fn2                     = 0x1df
      FnD                     = 0x1e0
      FnE                     = 0x1e1
      FnF                     = 0x1e2
      FnS                     = 0x1e3
      FnB                     = 0x1e4
      FnRightShift            = 0x1e5
      BrlDot1                 = 0x1f1
      BrlDot2                 = 0x1f2
      BrlDot3                 = 0x1f3
      BrlDot4                 = 0x1f4
      BrlDot5                 = 0x1f5
      BrlDot6                 = 0x1f6
      BrlDot7                 = 0x1f7
      BrlDot8                 = 0x1f8
      BrlDot9                 = 0x1f9
      BrlDot10                = 0x1fa
      Numeric0                = 0x200
      Numeric1                = 0x201
      Numeric2                = 0x202
      Numeric3                = 0x203
      Numeric4                = 0x204
      Numeric5                = 0x205
      Numeric6                = 0x206
      Numeric7                = 0x207
      Numeric8                = 0x208
      Numeric9                = 0x209
      NumericStar             = 0x20a
      NumericPound            = 0x20b
      NumericA                = 0x20c
      NumericB                = 0x20d
      NumericC                = 0x20e
      NumericD                = 0x20f
      CameraFocus             = 0x210
      WpsButton               = 0x211
      TouchpadToggle          = 0x212
      TouchpadOn              = 0x213
      TouchpadOff             = 0x214
      CameraZoomin            = 0x215
      CameraZoomout           = 0x216
      CameraUp                = 0x217
      CameraDown              = 0x218
      CameraLeft              = 0x219
      CameraRight             = 0x21a
      AttendantOn             = 0x21b
      AttendantOff            = 0x21c
      AttendantToggle         = 0x21d
      LightsToggle            = 0x21e
      BtnDpadUp               = 0x220
      BtnDpadDown             = 0x221
      BtnDpadLeft             = 0x222
      BtnDpadRight            = 0x223
      AlsToggle               = 0x230
      RotateLockToggle        = 0x231
      Buttonconfig            = 0x240
      Taskmanager             = 0x241
      Journal                 = 0x242
      Controlpanel            = 0x243
      Appselect               = 0x244
      Screensaver             = 0x245
      Voicecommand            = 0x246
      Assistant               = 0x247
      KbdLayoutNext           = 0x248
      BrightnessMin           = 0x250
      BrightnessMax           = 0x251
      KbdinputassistPrev      = 0x260
      KbdinputassistNext      = 0x261
      KbdinputassistPrevgroup = 0x262
      KbdinputassistNextgroup = 0x263
      KbdinputassistAccept    = 0x264
      KbdinputassistCancel    = 0x265
      RightUp                 = 0x266
      RightDown               = 0x267
      LeftUp                  = 0x268
      LeftDown                = 0x269
      RootMenu                = 0x26a
      MediaTopMenu            = 0x26b
      Numeric11               = 0x26c
      Numeric12               = 0x26d
      AudioDesc               = 0x26e
      Key3dMode               = 0x26f
      NextFavorite            = 0x270
      StopRecord              = 0x271
      PauseRecord             = 0x272
      Vod                     = 0x273
      Unmute                  = 0x274
      Fastreverse             = 0x275
      Slowreverse             = 0x276
      Data                    = 0x277
      OnscreenKeyboard        = 0x278
      PrivacyScreenToggle     = 0x279
      SelectiveScreenshot     = 0x27a
      Macro1                  = 0x290
      Macro2                  = 0x291
      Macro3                  = 0x292
      Macro4                  = 0x293
      Macro5                  = 0x294
      Macro6                  = 0x295
      Macro7                  = 0x296
      Macro8                  = 0x297
      Macro9                  = 0x298
      Macro10                 = 0x299
      Macro11                 = 0x29a
      Macro12                 = 0x29b
      Macro13                 = 0x29c
      Macro14                 = 0x29d
      Macro15                 = 0x29e
      Macro16                 = 0x29f
      Macro17                 = 0x2a0
      Macro18                 = 0x2a1
      Macro19                 = 0x2a2
      Macro20                 = 0x2a3
      Macro21                 = 0x2a4
      Macro22                 = 0x2a5
      Macro23                 = 0x2a6
      Macro24                 = 0x2a7
      Macro25                 = 0x2a8
      Macro26                 = 0x2a9
      Macro27                 = 0x2aa
      Macro28                 = 0x2ab
      Macro29                 = 0x2ac
      Macro30                 = 0x2ad
      MacroRecordStart        = 0x2b0
      MacroRecordStop         = 0x2b1
      MacroPresetCycle        = 0x2b2
      MacroPreset1            = 0x2b3
      MacroPreset2            = 0x2b4
      MacroPreset3            = 0x2b5
      KbdLcdMenu1             = 0x2b8
      KbdLcdMenu2             = 0x2b9
      KbdLcdMenu3             = 0x2ba
      KbdLcdMenu4             = 0x2bb
      KbdLcdMenu5             = 0x2bc
      BtnTriggerHappy         = 0x2c0
      BtnTriggerHappy1        = 0x2c0
      BtnTriggerHappy2        = 0x2c1
      BtnTriggerHappy3        = 0x2c2
      BtnTriggerHappy4        = 0x2c3
      BtnTriggerHappy5        = 0x2c4
      BtnTriggerHappy6        = 0x2c5
      BtnTriggerHappy7        = 0x2c6
      BtnTriggerHappy8        = 0x2c7
      BtnTriggerHappy9        = 0x2c8
      BtnTriggerHappy10       = 0x2c9
      BtnTriggerHappy11       = 0x2ca
      BtnTriggerHappy12       = 0x2cb
      BtnTriggerHappy13       = 0x2cc
      BtnTriggerHappy14       = 0x2cd
      BtnTriggerHappy15       = 0x2ce
      BtnTriggerHappy16       = 0x2cf
      BtnTriggerHappy17       = 0x2d0
      BtnTriggerHappy18       = 0x2d1
      BtnTriggerHappy19       = 0x2d2
      BtnTriggerHappy20       = 0x2d3
      BtnTriggerHappy21       = 0x2d4
      BtnTriggerHappy22       = 0x2d5
      BtnTriggerHappy23       = 0x2d6
      BtnTriggerHappy24       = 0x2d7
      BtnTriggerHappy25       = 0x2d8
      BtnTriggerHappy26       = 0x2d9
      BtnTriggerHappy27       = 0x2da
      BtnTriggerHappy28       = 0x2db
      BtnTriggerHappy29       = 0x2dc
      BtnTriggerHappy30       = 0x2dd
      BtnTriggerHappy31       = 0x2de
      BtnTriggerHappy32       = 0x2df
      BtnTriggerHappy33       = 0x2e0
      BtnTriggerHappy34       = 0x2e1
      BtnTriggerHappy35       = 0x2e2
      BtnTriggerHappy36       = 0x2e3
      BtnTriggerHappy37       = 0x2e4
      BtnTriggerHappy38       = 0x2e5
      BtnTriggerHappy39       = 0x2e6
      BtnTriggerHappy40       = 0x2e7

      def type
        EventType::Key
      end
    end

    enum Rel
      X           = 0x00
      Y           = 0x01
      Z           = 0x02
      Rx          = 0x03
      Ry          = 0x04
      Rz          = 0x05
      Hwheel      = 0x06
      Dial        = 0x07
      Wheel       = 0x08
      Misc        = 0x09
      Reserved    = 0x0a
      WheelHiRes  = 0x0b
      HwheelHiRes = 0x0c

      def type
        EventType::Rel
      end
    end

    enum Abs
      X             = 0x00
      Y             = 0x01
      Z             = 0x02
      Rx            = 0x03
      Ry            = 0x04
      Rz            = 0x05
      Throttle      = 0x06
      Rudder        = 0x07
      Wheel         = 0x08
      Gas           = 0x09
      Brake         = 0x0a
      Hat0x         = 0x10
      Hat0y         = 0x11
      Hat1x         = 0x12
      Hat1y         = 0x13
      Hat2x         = 0x14
      Hat2y         = 0x15
      Hat3x         = 0x16
      Hat3y         = 0x17
      Pressure      = 0x18
      Distance      = 0x19
      TiltX         = 0x1a
      TiltY         = 0x1b
      ToolWidth     = 0x1c
      Volume        = 0x20
      Misc          = 0x28
      Reserved      = 0x2e
      MtSlot        = 0x2f
      MtTouchMajor  = 0x30
      MtTouchMinor  = 0x31
      MtWidthMajor  = 0x32
      MtWidthMinor  = 0x33
      MtOrientation = 0x34
      MtPositionX   = 0x35
      MtPositionY   = 0x36
      MtToolType    = 0x37
      MtBlobId      = 0x38
      MtTrackingId  = 0x39
      MtPressure    = 0x3a
      MtDistance    = 0x3b
      MtToolX       = 0x3c
      MtToolY       = 0x3d

      def type
        EventType::Abs
      end
    end

    enum Sw
      Lid                = 0x00
      TabletMode         = 0x01
      HeadphoneInsert    = 0x02
      RfkillAll          = 0x03
      Radio              = RfkillAll
      MicrophoneInsert   = 0x04
      Dock               = 0x05
      LineoutInsert      = 0x06
      JackPhysicalInsert = 0x07
      VideooutInsert     = 0x08
      CameraLensCover    = 0x09
      KeypadSlide        = 0x0a
      FrontProximity     = 0x0b
      RotateLock         = 0x0c
      LineinInsert       = 0x0d
      MuteDevice         = 0x0e
      PenInserted        = 0x0f
      MachineCover       = 0x10

      def type
        EventType::Sw
      end
    end

    enum Msc
      Serial    = 0x00
      Pulseled  = 0x01
      Gesture   = 0x02
      Raw       = 0x03
      Scan      = 0x04
      Timestamp = 0x05

      def type
        EventType::Msc
      end
    end

    enum Led
      Numl     = 0x00
      Capsl    = 0x01
      Scrolll  = 0x02
      Compose  = 0x03
      Kana     = 0x04
      Sleep    = 0x05
      Suspend  = 0x06
      Mute     = 0x07
      Misc     = 0x08
      Mail     = 0x09
      Charging = 0x0a

      def type
        EventType::Led
      end
    end

    enum Rep
      Delay  = 0x00
      Period = 0x01

      def type
        EventType::Rep
      end
    end

    enum Snd
      Click = 0x00
      Bell  = 0x01
      Tone  = 0x02

      def type
        EventType::Snd
      end
    end

    enum Ff
      Rumble     = 0x50
      Periodic   = 0x51
      Constant   = 0x52
      Spring     = 0x53
      Friction   = 0x54
      Damper     = 0x55
      Inertia    = 0x56
      Ramp       = 0x57
      Square     = 0x58
      Triangle   = 0x59
      Sine       = 0x5a
      SawUp      = 0x5b
      SawDown    = 0x5c
      Custom     = 0x5d
      Gain       = 0x60
      Autocenter = 0x61

      def type
        EventType::Ff
      end
    end

    enum FfStatus
      Stopped = 0x00
      Playing = 0x01

      def type
        EventType::FfStatus
      end
    end
  end
end
