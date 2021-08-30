--Johnny Zhu
--jianyezhu@qq.com
--2021.08.30
--------------------------------------------------------------------
-- UI variables
--------------------------------------------------------------------
-- controls
--btn_enable = Controls["Enable"]
knob_midichannel = Controls["MIDI Channel"]

btn_scene = Controls["SceneButton"]
knob_scene = Controls["SceneKnob"]
-- btn_scene = Controls.SceneButton
-- knob_scene = Controls.SceneKnob

btn_inputmute = Controls["InputMute"]
fader_inputfader = Controls["InputFader"]
btn_outputmute = Controls["OutputMute"]
fader_outputfader = Controls["OutputFader"]

--Connection Status
stat_details = Controls["Status"]
--[[ Status.Value:
5-Initializing-blue	
4-Missing	-#C00000	
3-Not Present-gray	
2-Fault-red	
1-Compromised-orange	
0-OK-green	
]]--

-- TCP/UCP connection
txt_address = Controls["IP Address"]
knb_port = Controls["Port"]
knb_port.Value = 51325


--------------------------------------------------------------------
-- Other variables and CONSTANTS
--------------------------------------------------------------------
--Global Variables
tx = ""
midiChannel = knob_midichannel.Value -1 

--CONSTANTS
--STX = "\x02"
ETX = ""
--ETX = "\x0D\x0A"

-- commands to device

--------------------------------------------------------------------
-- Function Definition
--------------------------------------------------------------------
function DebugFormatHex(string,hex) -- Format strings containing non-printable characters so we can see what they are
  local visual = ""
  local format = hex~=nil and "\\x%02x" or "[%02X]" --hex==nil: format="[%02X]";  hex~=nil: format="\\x%02x"
  for i=1,#string do
    local byte = string:sub(i,i)
    visual = visual..string.format(format,string.byte(byte))
  end
  return visual
end

--------------------------------------------------------------------
-- Socket Connection
--------------------------------------------------------------------
-- socket
sock = TcpSocket.New()
sock.ReadTimeout = 0
sock.WriteTimeout = 0
sock.ReconnectTimeout = 5
sock:Connect(txt_address.String, knb_port.Value)

-- send data
function send(data)
  --print("sending: "..data)
  tx = data
  sock:Connect(txt_address.String, knb_port.Value)
end

-- report connection details to gui
function connStat(message, severity)
  stat_details.Value = severity
  stat_details.String = message
  
  if severity == 2 then
    Log.Error(string.format("%s:%s\t%s", txt_address.String, knb_port.String, message))
  end
end

-- do when event is data
function parseResponse()
  
  rx = sock:Read(sock.BufferLength)
  
  if rx ~= nil then
    print("received: "..DebugFormatHex(rx))
    stat_details.String = "RX: "..DebugFormatHex(rx)
    -- do something with data here
  end
  
  --sock:Disconnect()
  --connStat("socket closed by client", 1)
end
    
sock.EventHandler = function(sock, evt, err)
  if evt == TcpSocket.Events.Connected then -- Connected
    connStat("TX: "..DebugFormatHex(tx), 0)
    sock:Write(tx)
    print("sending: "..DebugFormatHex(tx) )

  elseif evt == TcpSocket.Events.Reconnect then -- Reconnecting
    connStat("socket reconnecting...", 5)
  elseif evt == TcpSocket.Events.Data then  -- Data
    connStat("data received from remote", 0)
    parseResponse()   
  elseif evt == TcpSocket.Events.Closed then  -- Closed by remote
    connStat("socket closed by remote", 4)
  elseif evt == TcpSocket.Events.Error then -- Error
    connStat("socket closed due to error", 2)
  elseif evt == TcpSocket.Events.Timeout then -- Timeout
    connStat("socket closed due to timeout", 3)
  end  
end

--------------------------------------------------------------------
-- Event Handlers
--------------------------------------------------------------------

--btn_enable.EventHandler = function()
  --send(enable) 
  --end
knob_midichannel.EventHandler = function()
  midiChannel = knob_midichannel.Value -1 
  print("MIDI Channel = "..string.format("0x%02X", midiChannel) )
  end

--[[
for i=1, #btn_scene do
  btn_scene[i].EventHandler = function()
    send(scene[i])
  end
end
]]--  
for i=1, #btn_scene do
  btn_scene[i].EventHandler = function()
    if btn_scene[i].Boolean == true then
      tx = string.format("%c", 0xB0 + midiChannel).."\x00\x00"..string.format("%c", 0xB0 + midiChannel).."\x20\x00"..string.format("%c", 0xC0 + midiChannel)..string.format("%c", i-1)..ETX
      send(tx)
    end
  end
end

knob_scene.EventHandler = function()
  tx = string.format("%c", 0xB0 + midiChannel).."\x00\x00"..string.format("%c", 0xB0 + midiChannel).."\x20\x00"..string.format("%c", 0xC0 + midiChannel)..string.format("%c", knob_scene.Value -1)..ETX
  send(tx)
  end
  
--Mute on   9N, CH, 7F,     8N, CH, 00
--Mute off  9N, CH, 3F,     8N, CH, 00 
for i=1, #btn_inputmute do
  btn_inputmute[i].EventHandler = function()
      if btn_inputmute[i].Boolean == true then  --on
        tx = string.format("%c", 0x90 + midiChannel)..string.format("%c", 0x1F + i).."\x7F"..string.format("%c", 0x80 + midiChannel)..string.format("%c", 0x1F + i).."\x00"..ETX
      else
        tx = string.format("%c", 0x90 + midiChannel)..string.format("%c", 0x1F + i).."\x3F"..string.format("%c", 0x80 + midiChannel)..string.format("%c", 0x1F + i).."\x00"..ETX
      end
    send(tx)
  end
end

for i=1, #btn_outputmute do
  btn_outputmute[i].EventHandler = function()
      if btn_outputmute[i].Boolean == true then  --on
        tx = string.format("%c", 0x90 + midiChannel)..string.format("%c", 0x5F + i).."\x7F"..string.format("%c", 0x80 + midiChannel)..string.format("%c", 0x5F + i).."\x00"..ETX
      else
        tx = string.format("%c", 0x90 + midiChannel)..string.format("%c", 0x5F + i).."\x3F"..string.format("%c", 0x80 + midiChannel)..string.format("%c", 0x5F + i).."\x00"..ETX
      end
    send(tx)
  end
end

--Fader     BN, 63, CH, BN, 62, 17, BN, 06, VA BN, 26, 07 
for i=1, #fader_inputfader do
  fader_inputfader[i].EventHandler = function()
    tx = string.format("%c", 0xB0 + midiChannel).."\x63"..string.format("%c", 0x1F + i)..string.format("%c", 0xB0 + midiChannel).."\x62\x17"..string.format("%c", 0xB0 + midiChannel).."\x06"..string.format("%c", fader_inputfader[i].Value)..string.format("%c", 0xB0 + midiChannel).."\x26\x07"..ETX
    send(tx)
  end
end

for i=1, #fader_outputfader do
  fader_outputfader[i].EventHandler = function()
    tx = string.format("%c", 0xB0 + midiChannel).."\x63"..string.format("%c", 0x5F + i)..string.format("%c", 0xB0 + midiChannel).."\x62\x17"..string.format("%c", 0xB0 + midiChannel).."\x06"..string.format("%c", fader_outputfader[i].Value)..string.format("%c", 0xB0 + midiChannel).."\x26\x07"..ETX
    send(tx)
  end
end

