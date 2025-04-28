# MK3 4X
Duel to the death with 4X AI-generated sprites!

# Getting started (Visual Studio)

- clone the repository
- install *Desktop development with C++* workload
- install [vcpkg](https://github.com/microsoft/vcpkg) and relevant dependencies (see below)
- open the Visual Studio solution `CODE/MK3Reboot.sln`
- build any _Debug_ or _Release_ configuration for _x86_ platform

NOTE: 64-bit build fails as MASM isn't able to compile the code.

## Dependencies

```
git clone https://github.com/microsoft/vcpkg
cd vcpkg
bootstrap-vcpkg.bat
vcpkg integrate install
vcpkg install inih:x86-windows
```

## 4X Sprite Cache
Download **MK3RebootCache-0.bin** and copy it to **\Runtime** folder, next to the executable.

https://drive.google.com/file/d/1Xm8-Bu2sUaXG4ZY2cK_jjjEhxVyvhvlV/view?usp=sharing

# Controls

## Joystick

|Input|Description|
|-|-|
|<kbd>X</kbd>|High punch|
|<kbd>A</kbd>|Low punch|
|<kbd>Y</kbd>|High kick|
|<kbd>B</kbd>|Low kick|
|<kbd>Start</kbd>|Pause|
|<kbd>Left trigger</kbd>|Block|
|<kbd>Right trigger</kbd>|Run|
|<kbd>Left shoulder</kbd>|Run|
|<kbd>Right shoulder</kbd>|Block|
|<kbd>D-Pad</kbd>|Move|
|<kbd>Left stick</kbd>|Move|

## Keyboard

|Input|Description|
|-|-|
|<kbd>P</kbd>|Pause|
|<kbd>O</kbd>|Run frame by frame (when paused)|
|<kbd>Space</kbd>|Run as fast as possible|
|<kbd>Ins</kbd>|Display back buffer content|
