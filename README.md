![Screenshot](https://bitbucket.org/JianyeZhu/allen-heath-qu-mixer-plugin/src/master/Screenshot.jpg)

# Notes

1. This is my first plugin.
2. This plugin is one-way communication only. It doesn't process the messages from the mixer.
3. QSC hardware is NOT required to test the plugin.
4. Type the Qu mixer's IP address into the qsys module.
5. Check the MIDI settings on the Qu mixer and set the qsys module to the same MIDI channel. The default channel on the mixer is 1.
6. This module may not run simultaneously with iPad Qu-pad app.
7. This is based on QU_MIDI_Protocol_v1.9 which requires the Qu mixer loaded with firmware version V1.9 or later.
8. This plugin is designed to work with all Qu models.
9. This runtime lua script has been tested by the FB group members with real QU mixer.

MIDI over TCP/IP

<https://www.allen-heath.com/thirdpartycontrol/>

<https://www.allen-heath.com/media/Qu_MIDI_Protocol_V1.9.pdf>

Qu-Pac is the mix engine of the Qu-32 in a compact rack mountable format.
Qu-SB is the mix engine of the Qu-32 in a compact rack mountable format.

Johnny Zhu
2021-08-30
<https://bitbucket.org/JianyeZhu/allen-heath-qu-mixer-plugin>
