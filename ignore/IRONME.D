// creator  : C:\Users\Laurie\NearInfinity\NearInfinity.jar (v2.1-20200901)
// game     : C:\Users\Laurie\Beamdog Library\BG1 Test
// resource : IRONME.DLG
// source   : Override\IRONME.DLG
// dialog   : Lang\en_US\dialog.tlk
// dialogF  : (none)

BEGIN ~IRONME~
//////////////////////////////////////////////////
// WARNING: this file contains non-trivial WEIGHTs
//////////////////////////////////////////////////

IF WEIGHT #2 /* Triggers after states #: 3 6 even though they appear after this state */
~  True()
~ THEN BEGIN 0 // from:
  SAY #1490 /* ~What is your business here? If you're here about obtaining iron shipments for your company, then you'd be best to do so elsewhere. We have no interest in dealing with other companies.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 1 // from:
  SAY #1491 /* ~Spare my life and I'll tell you anything you want.~ */
  IF ~  Global("Chapter","GLOBAL",5)
~ THEN REPLY #1496 /* ~Tell us where we can find your leaders.~ */ GOTO 2
  IF ~~ THEN REPLY #1497 /* ~Ah, stop your whining and get out of here.~ */ DO ~EscapeArea()
~ EXIT
  IF ~~ THEN REPLY #1498 /* ~You're dead, no begging is going to change that.~ */ DO ~EscapeArea()
~ EXIT
  IF ~  Global("Chapter","GLOBAL",6)
~ THEN REPLY #1496 /* ~Tell us where we can find your leaders.~ */ GOTO 5
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY #1495 /* ~They're all at Candlekeep, except Thaldorn who's in his room in the upper levels. Please don't kill me.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #27175 /* ~Investigating the Iron Throne
I've learned that one of the Iron Throne leaders is on the fourth floor of the Iron Throne citadel.~ */ EXIT
END

IF WEIGHT #1 /* Triggers after states #: 6 even though they appear after this state */
~  Global("Chapter","GLOBAL",5)
StateCheck(Myself,STATE_CHARMED)
~ THEN BEGIN 3 // from:
  SAY #6271 /* ~Well, friends, if you want to meet the leaders of the Iron Throne, you'll have to go to Candlekeep. That's where Brunos and Rieltar went.~ */
  IF ~~ THEN UNSOLVED_JOURNAL #27176 /* ~Investigating the Iron Throne
A merchant told us that Brunos and Rieltar, two of the Iron Throne leaders, have traveled to Candlekeep.~ */ EXIT
END

IF ~~ THEN BEGIN 4 // from:
  SAY #9207 /* ~You've made no friends here! Move along!~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5 // from: 1.3
  SAY #34190 /* ~Well, friends, if you want to meet the leaders of the Iron Throne, you can find them on the top floor. But they're in an important meeting and don't want to be disturbed.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #0 ~  StateCheck(Myself,STATE_CHARMED)
Global("Chapter","GLOBAL",6)
~ THEN BEGIN 6 // from:
  SAY #34190 /* ~Well, friends, if you want to meet the leaders of the Iron Throne, you can find them on the top floor. But they're in an important meeting and don't want to be disturbed.~ */
  IF ~~ THEN EXIT
END
