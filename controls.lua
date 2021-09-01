table.insert(ctrls, {
  Name = "SceneButton",
  ControlType = "Button",
  ButtonType = "Momentary",
  Count = 100,
  --UserPin = true,
  --PinStyle = "Input",
  Icon = "<NONE>"
})
table.insert(ctrls, {
  Name = "SceneKnob",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Count = 1,
  Min = 1, 
  Max = 100,
  UserPin = true,
  PinStyle = "Both"
})
table.insert(ctrls, {
  Name = "InputMute",
  ControlType = "Button",
  ButtonType = "Toggle",
  Count = 35,
  --UserPin = true,
  --PinStyle = "Both",
  Icon = "<NONE>"
})
table.insert(ctrls, {
  Name = "InputFader",
  ControlType = "Knob",
  ButtonType = "Fader",
  Count = 35,
  Min = 0, 
  Max = 127,
  --UserPin = true,
  --PinStyle = "Both",
})
table.insert(ctrls, {
  Name = "OutputMute",
  ControlType = "Button",
  ButtonType = "Toggle",
  Count = 14,
  --UserPin = true,
  --PinStyle = "Both",
  Icon = "<NONE>"
})
table.insert(ctrls, {
  Name = "OutputFader",
  ControlType = "Knob",
  ButtonType = "Fader",
  Count = 35,
  Min = 0, 
  Max = 127,
  --UserPin = true,
  --PinStyle = "Both",
})


--**Controls on Page "Setup"
table.insert(ctrls, {
  Name = "IP Address",
  ControlType = "Text",
  Count = 1,
  DefaultValue = "127.0.0.1"
})
table.insert(ctrls, {
  Name = "Port",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Count = 1,
  Min = 1, 
  Max = 65535,
  DefaultValue = 51325
})
table.insert(ctrls, {
  Name = "Status",
  ControlType = "Indicator", 
  IndicatorType = "Status",
  Count = 1,
  UserPin = true,
  PinStyle = "Output"
})
table.insert(ctrls, {
  Name = "MIDI Channel",
  ControlType = "Knob",
  ControlUnit = "Integer",
  Count = 1,
  Min = 1, 
  Max = 16,
  DefaultValue = 1
})
