local CurrentPage = PageNames[props["page_index"].Value]
--*** Page "Control" ********************************************************************************************* 
if CurrentPage == "Control" then
  table.insert(graphics,{
    Type = "GroupBox",
    Text = "Control",
    TextSize = 15,
    Fill = {118,178,219},
    StrokeWidth = 1,
    Position = {0,0},
    Size = {1280,720}
  })
  table.insert(graphics,{
    Type = "Header",
    Text = "Scene Recall",
    TextSize = 12,
    Fill = {50,50,50},
    StrokeWidth = 1,
    Position = {10,30},
    Size = {1260,15}
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Button",
    TextSize = 12,
    Position = {10,80},
    Size = {60,24},
    FontSize = 11,
    HTextAlign = "Right"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Combo Box",
    Position = {10,154},
    Size = {60,24},
    TextSize = 12,
    HTextAlign = "Right"
  })
  --Scene Buttons
  for sceneIdx = 1, 25 do
    layout["SceneButton "..sceneIdx] = {
      PrettyName = "Buttons~Recall Scene ",
      Style = "Button",
      Position = {75 + 48*(sceneIdx-1), 80},
      TextSize = 12,
      Size = {48,24},
      Color = {255,255,255},
      Legend = tostring(sceneIdx)
    }
  end
  --Scene Knob
  layout["SceneKnob"] = {
    PrettyName = "Knob~Recall Scene ",
    Style = "ComboBox",
    Position = {75, 154},
    Size = {60,24},
    Color = {110,198,241},
    TextSize = 12,
  }
  --Connection Status Led Indicator
  layout["Status"] = {
    Style = "Led", 
    PrettyName = "Device~Connection Status", 
    Position = {2, 2}, 
    Size = {16, 16},
    Margin = 2,
    TextSize = 12,

  }
  table.insert(graphics,{
    Type = "Header",
    Text = "Inputs",
    TextSize = 12,
    Fill = {50,50,50},
    StrokeWidth = 1,
    Position = {10,210},
    Size = {1260,15}
  })
  
  table.insert(graphics,{
    Type = "Header",
    Text = "Outputs",
    TextSize = 12,
    Fill = {50,50,50},
    StrokeWidth = 1,
    Position = {10,480},
    Size = {1260,15}
  })
  --Input Labels
  for channelIdx = 1, 32 do
    table.insert(graphics,{
      Type = "Text",
      Text = tostring(channelIdx),
      TextSize = 12,
      Position = {10 + 36*(channelIdx-1), 234},
      Size = {36,36},
      FontSize = 11,
      HTextAlign = "Middle"
    })
  end 
  for channelIdx = 1, 3 do
    table.insert(graphics,{
      Type = "Text",
      Text = "ST"..tostring(channelIdx),
      TextSize = 12,
      Position = {1162 + 36*(channelIdx-1), 234},
      Size = {36,36},
      FontSize = 11,
      HTextAlign = "Middle"
    })
  end 
  --Output Labels
  for channelIdx = 1, 4 do
    table.insert(graphics,{
      Type = "Text",
      Text = tostring(channelIdx),
      TextSize = 12,
      Position = {10 + 36*(channelIdx-1), 504},
      Size = {36,36},
      FontSize = 11,
      HTextAlign = "Middle"
    })
  end 
  table.insert(graphics,{
    Type = "Text",
    Text = "5-6",
    TextSize = 12,
    Position = {154, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "7-8",
    TextSize = 12,
    Position = {190, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "9-10",
    TextSize = 12,
    Position = {226, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "LR",
    TextSize = 12,
    Position = {262, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Grp 1-2",
    TextSize = 12,
    Position = {298, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
   
  table.insert(graphics,{
    Type = "Text",
    Text = "Grp 3-4",
    TextSize = 12,
    Position = {334, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Grp 5-6",
    TextSize = 12,
    Position = {370, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Grp 7-8",
    TextSize = 12,
    Position = {406, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "MTX 1-2",
    TextSize = 12,
    Position = {442, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "MTX 1-2",
    TextSize = 12,
    Position = {478, 504},
    Size = {36,36},
    FontSize = 11,
    HTextAlign = "Middle"
  })
  -- InputMute Buttons
  for channelIdx = 1, 35 do
    layout["InputMute "..channelIdx] = {
      PrettyName = "Buttons~Input Mute ",
      Style = "Button",
      Position = {10 + 36*(channelIdx-1), 270},
      TextSize = 12,
      Size = {36,16},
      Color = {255,0,0},
      --Legend = tostring(sceneIdx)
    }
  end
  -- InputMute Faders
  for channelIdx = 1, 35 do
    layout["InputFader "..channelIdx] = {
      PrettyName = "Fader~Input Fader ",
      Style = "Fader",
      Position = {10 + 36*(channelIdx-1), 297},
      TextSize = 12,
      Size = {36,128},
    }
  end
  -- OutputMute Buttons
  for channelIdx = 1, 14 do
    layout["OutputMute "..channelIdx] = {
      PrettyName = "Buttons~Output Mute ",
      Style = "Button",
      Position = {10 + 36*(channelIdx-1), 540},
      TextSize = 12,
      Size = {36,16},
      Color = {255,0,0},
    }
  end
  -- OutputMute Faders
  for channelIdx = 1, 14 do
    layout["OutputFader "..channelIdx] = {
      PrettyName = "Fader~Output Fader ",
      Style = "Fader",
      Position = {10 + 36*(channelIdx-1), 567},
      TextSize = 12,
      Size = {36,128},
    }
  end

  --*** Page "Setup" ********************************************************************************************* 
elseif CurrentPage == "Setup" then
  table.insert(graphics,{
    Type = "GroupBox",
    Text = "Setup",
    TextSize = 15,
    Fill = {118,178,219},
    StrokeWidth = 1,
    Position = {0,0},
    Size = {350,250}
  })
  --Show AH logo
  local AHLogo = "--[[ #encode "AHlogo.png" ]]"
  table.insert(graphics,{
    Type="Image",
    Image=AHLogo,
    Position={205,220},
    Size={141,30}
  })
  --Show Qu logo
  local QuLogo = "--[[ #encode "Qulogo.png" ]]"
  table.insert(graphics,{
    Type="Image",
    Image=QuLogo,
    Position={228,0},
    Size={115,67}
  })

  table.insert(graphics,{
    Type = "Header",
    Text = "Setup",
    TextSize = 12,
    Fill = {50,50,50},
    StrokeWidth = 1,
    Position = {10,30},
    Size = {205,15}
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "IP Address",
    TextSize = 12,
    Position = {12,80},
    Size = {72,24},
    HTextAlign = "Right"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Port: 51325 ",
    TextSize = 12,
    Position = {12,104},
    Size = {72,24},
    HTextAlign = "Right"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "Status",
    TextSize = 12,
    Position = {12,140},
    Size = {72,24},
    HTextAlign = "Right"
  })
  table.insert(graphics,{
    Type = "Text",
    Text = "MIDI Channel",
    TextSize = 12,
    Position = {12,176},
    Size = {72,24},
    HTextAlign = "Right"
  })
  layout["IP Address"] = {
    PrettyName = "Mixer's IP Address",
    Style = "TextField",
    Position = {84, 80},
    Size = {106,24},
    Color = {255,255,255},
    TextSize = 12,
  }
--[[   layout["Port"] = {
    PrettyName = "Fixed at 51325",
    Style = "TextField",
    Position = {84, 105},
    Size = {106,24},
    Color = {110,198,241},
    TextSize = 12,
  }
 ]]
  layout["Status"] = {
    PrettyName = "Connection Status",
    Style = "Status",
    Position = {84, 138},
    Size = {230,24}
    --Color = {194,194,194},
    --IsReadOnly = true
  }
  layout["MIDI Channel"] = {
    PrettyName = "MIDI Channel (Setup on Mixer)",
    Style = "ComboBox",
    Position = {84, 176},
    Size = {60,24},
    Color = {110,198,241},
    TextSize = 12,
  }
end