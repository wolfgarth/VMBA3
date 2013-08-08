SCRIPT README
==============

SCRIPT: Hostage
Version: 0.2
Developer(s): Dr_Cox1911



README CONTENTS
===============

01. VERSION HISTORY
02. COPYRIGHT STATEMENT
03. TERMS OF USE
04. LEGAL DISCLAIMER
05. INSTALLATION
06. REQUIRED ADDONS
07. NOTES
08. CHANGE HISTORY



01. VERSION HISTORY
===================

Version | Date | Notes
0.1	|130325| Alpha
0.2	|130329| Alpha


02. COPYRIGHT STATEMENT
=======================

This script is (c)2013 Dr_Cox1911. All rights reserved.



03. TERMS OF USE
================

This script (hereafter 'Software') contains files to be used in the PC CD-ROM simulator "Armed Assault 3" (hereafter 'ArmA3'). To use the Software you must agree to the following conditions of use:

1. Dr_Cox1911 (hereafter 'The Author(s)') grant to you a personal, non-exclusive license to use the Software.

2. The commercial exploitation of the Software without written permission from The Author(s) is expressly prohibited.



04. LEGAL DISCLAIMER
====================

The Software is distributed without any warranty; without even the implied warranty of merchantability or fitness for a particular purpose. The Software is not an official addon or tool. Use of the Software (in whole or in part) is entirely at your own risk.



05. INSTALLATION
================

To begin using the Software:

1. Place the "captive.sqf" and the "captivevars.sqf" inside your missionfolder.
2. Place the following code in the init-line of your hostage:
	_null = [this] execVM "captive.sqf"
3. Alter the amount of spawnpoints within the "captive.sqf"
4. Place the amount of markers named like you did in the "captive.sqf" (e.g. "cap_pos0")



06. REQUIRED ADDONS
===================

To play this mission the following addons are required:

NONE


07. NOTES
=========

Hope you like it!



08. CHANGE HISTORY
==================

Version | Date

0.1 | 130325
*initial Alpha release

0.2 | 130329
*Reworked the code (hopefully easier to handle now)
*Added MP-compatibility (need more testing though | Thanks to FSF_TargetZero)
