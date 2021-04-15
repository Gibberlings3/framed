// creator  : C:\Users\Laurie\NearInfinity\NearInfinity.jar (v2.1-20200901)
// game     : C:\Users\Laurie\Beamdog Library\BG1 Test
// resource : TETHTO2.DLG
// source   : data\DIALOG.BIF
// dialog   : Lang\en_US\dialog.tlk
// dialogF  : (none)

BEGIN ~TETHTO2~
//////////////////////////////////////////////////
// WARNING: this file contains non-trivial WEIGHTs
//////////////////////////////////////////////////

IF WEIGHT #1 /* Triggers after states #: 1 even though they appear after this state */
~  NumberOfTimesTalkedTo(0)
~ THEN BEGIN 0 // from:
  SAY #16803 /* ~You there! I have come to speak with <CHARNAME>. Hast thou come to collect the inheritance from your father? He left thee several items, all of which are within his old room. You remember where his old room is, don't you? If you've somehow forgotten, it's on the fifth floor of the central keep. Please forgive my abrupt nature, but much requires my attention this day. It is important that we later speak of your foster father, but not now.~ */
  IF ~~ THEN EXIT
END

IF WEIGHT #0 ~  Global("Arrested","GLOBAL",1)
~ THEN BEGIN 1 // from:
  SAY #16804 /* ~Hello young one, I am sorry to see thee in such terrible circumstances. I know thee well enough to see that you have been falsely accused. Tomorrow Ulraunt will most likely sentence thee to be sent to Baldur's Gate. There, thou wouldst receive the death penalty for these actions. I know that Gorion would not want to see his only child killed a scant few weeks after his own death. 'Tis as a favor to his memory that I will help thee escape. Make thy way through the catacombs beneath the library, but disturb them not. I have your possessions with me, you must take them and go with haste.~ */
  IF ~  Global("TalkedToKoveras","GLOBAL",1)
~ THEN REPLY #16808 /* ~Do you know anyone by the name of Koveras?~ */ GOTO 2
  IF ~~ THEN REPLY #16809 /* ~Thank you for helping us.~ */ GOTO 3
  IF ~  Dead("RIELTAR")
~ THEN REPLY #11845 /* ~Actually I did kill them, but they're the leaders of the Iron Throne. They were the people behind the iron shortage and everything else that's been wrong with the Sword Coast. We did everyone a favor by killing them.~ */ GOTO 5
END

IF ~~ THEN BEGIN 2 // from: 1.0
  SAY #16807 /* ~I know of no one named Koveras, but Koveras is the reverse of Sarevok, a young man who accompanied the leaders of the Iron Throne when they first came. I know not where he has gone.~ */
  IF ~~ THEN GOTO 3
END

IF ~~ THEN BEGIN 3 // from: 1.1 2.0 5.0
  SAY #16893 /* ~It is now time for you to go, <CHARNAME>. I can teleport you to the secret room that leads to the catacombs, but from there you are on your own. You must be careful within the catacombs, as there are many guardians and traps, and perhaps whoever planned these murders. However dangerous the catacombs may be, they are a safer alternative to Ulraunt's wrath.~ */
  IF ~~ THEN REPLY #9747 /* ~Teleport us to the secret library, we're as ready as we'll ever be.~ */ DO ~SetGlobal("Teth","GLOBAL",1)
ClearAllActions()
StartCutSceneMode()
StartCutScene("cuttetht")
~ EXIT
  IF ~~ THEN REPLY #9748 /* ~Why can't you teleport us outside of Candlekeep?~ */ GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 3.1
  SAY #9749 /* ~Candlekeep is protected by powerful runes that seal it from divinatory and alteration magics. If I were to teleport you outside of Candlekeep, you would be ripped asunder when you came in contact with the protective field. Trust me, child, this is the only way.~ */
  IF ~~ THEN DO ~SetGlobal("Teth","GLOBAL",1)
ClearAllActions()
StartCutSceneMode()
StartCutScene("cuttetht")
~ EXIT
END

IF ~~ THEN BEGIN 5 // from: 1.2
  SAY #11844 /* ~That is unfortunate... that you had to resort to killing. I believe you, and your reasons seem valid, but I still cannot agree with what you have done. If you had presented your case with evidence or proof of some sort instead of simply killing them, events might have happened differently. As it is, you are a criminal in the eyes of your enemies AND the law. Still, it would seem that someone wishes to secure your fate, even though you ARE guilty. Much more evidence points to you, much more than you admit to. I am not prone to suspicions, but I would almost believe that someone intended those men dead and was going to blame you regardless. If this is so, then those men, evil though they were, were not your true enemies, and this does not bode well for the Sword Coast. I will help you escape so you may continue your crusade, but remember that the authorities will not believe your accusations without proof, especially now that you are an accused murderer.~ */
  IF ~~ THEN GOTO 3
END
