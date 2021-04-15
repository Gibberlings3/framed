// creator  : C:\Users\Laurie\NearInfinity\NearInfinity.jar (v2.1-20200901)
// game     : C:\Users\Laurie\Beamdog Library\BGEET
// resource : ARKANI3.DLG
// source   : Override\ARKANI3.DLG
// dialog   : Lang\en_US\dialog.tlk
// dialogF  : (none)

BEGIN ~ARKANI3~

IF ~  NumTimesTalkedTo(0)
~ THEN BEGIN 0 // from:
  SAY #210794 /* ~By the gods, that... that thing was young Dreppin! What is going on, <CHARNAME>?! Obe asked us to search for you here but... but this is far more foul than any of his most fearsome illusions!~ */
  IF ~  ReputationGT(Player1,7)
~ THEN REPLY #210795 /* ~It's a long story, Arkanis. Please, you have to help me get out of here, and fast. Can I trust you?~ */ GOTO 1
  IF ~  ReputationGT(Player1,7)
~ THEN REPLY #210796 /* ~That "thing" was a doppelganger, just like you... Out of respect for the face you wear, mirrorkin, I might just let you live. Flee this place before I change my mind!~ */ GOTO 2
  IF ~  ReputationLT(Player1,8)
~ THEN REPLY #210797 /* ~That "thing" was a doppelganger, just like you... Out of respect for the face you wear, mirrorkin, I might just let you live. Flee this place before I change my mind!~ */ GOTO 3
  IF ~  ReputationLT(Player1,8)
~ THEN REPLY #210802 /* ~It's a long story, Arkanis, and I have no time to tell it to you. Begone before you get the same as Dreppin!~ */ GOTO 2
  IF ~Global("C#Grey_Arkanis","GLOBAL",0)
OR(2)
InParty("C#Grey")
Global("C#GreyJoined","GLOBAL",2)
InMyArea("C#Grey")
!StateCheck("C#Grey",CD_STATE_NOTVALID)
Global("C#Grey_DREPPI3_0","GLOBAL",1)
~ THEN DO ~SetGlobal("C#Grey_Arkanis","GLOBAL",1)~ GOTO 4
END

IF ~~ THEN BEGIN 1 // from: 0.0 4.0 5.0
  SAY #210798 /* ~Aye, child, trust me you can, and Deder, too. I know not what assistance we can be to you, except four strong arms and an eye for illusions... We shall see you to the end of these crypts but not beyond, as we must bear witness to the horrors that befoul this place.~ */
  IF ~~ THEN EXIT
  IF ~Global("X#VicArk","GLOBAL",0)
InParty("viconia")
InMyArea("viconia")
!StateCheck("viconia",CD_STATE_NOTVALID)
~ THEN DO ~SetGlobal("X#VicArk","GLOBAL",1)~ EXTERN ~VICONJ~ 113
END

IF ~~ THEN BEGIN 2 // from: 0.1 0.3 4.1 4.3 5.1 5.3
  SAY #210799 /* ~As you order, so shall it be, my old comrade. Come, Deder... <CHARNAME> has spoken.~ */
  IF ~~ THEN DO ~ActionOverride("DEDER",EscapeArea())
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 3 // from: 0.2 4.2 5.2
  SAY #210800 /* ~They were right about you, <CHARNAME>. You've become a monster... I know not what forces chase you in these depths, but two have just joined their number! Come, Deder... in Gorion's good name.~ */
  IF ~~ THEN DO ~ActionOverride("DEDER",Enemy())
Enemy()
~ EXIT
END

IF ~~ THEN BEGIN 4 // from: 0.4
  SAY #301782 /* ~This is doppelgangers! Did I see it right that Grey smells them out? That is really extraordinary. I wasn't aware a dog can do this. Would think that it won't work on a Greater Doppelganger, though. Never heard of Durlag Trollkiller ordering a bunch of war dogs to get rid of his doppelganger poblem!~ */
  IF ~  ReputationGT(Player1,7)
~ THEN REPLY #210795 /* ~It's a long story, Arkanis. Please, you have to help me get out of here, and fast. Can I trust you?~ */ GOTO 1
  IF ~  ReputationGT(Player1,7)
~ THEN REPLY #210796 /* ~That "thing" was a doppelganger, just like you... Out of respect for the face you wear, mirrorkin, I might just let you live. Flee this place before I change my mind!~ */ GOTO 2
  IF ~  ReputationLT(Player1,8)
~ THEN REPLY #210797 /* ~That "thing" was a doppelganger, just like you... Out of respect for the face you wear, mirrorkin, I might just let you live. Flee this place before I change my mind!~ */ GOTO 3
  IF ~  ReputationLT(Player1,8)
~ THEN REPLY #210802 /* ~It's a long story, Arkanis, and I have no time to tell it to you. Begone before you get the same as Dreppin!~ */ GOTO 2
  IF ~  OR(2)
InParty("C#Grey")
Global("C#GreyJoined","GLOBAL",2)
InMyArea("C#Grey")
!StateCheck("C#Grey",CD_STATE_NOTVALID)
Global("C#Grey_DREPPI3_0","GLOBAL",1)
~ THEN GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 4.4
  SAY #301783 /* ~We have to stop these foul creatures. How come the catacombs are overrun by doppelgangers?!~ */
  IF ~  ReputationGT(Player1,7)
~ THEN REPLY #210795 /* ~It's a long story, Arkanis. Please, you have to help me get out of here, and fast. Can I trust you?~ */ GOTO 1
  IF ~  ReputationGT(Player1,7)
~ THEN REPLY #210796 /* ~That "thing" was a doppelganger, just like you... Out of respect for the face you wear, mirrorkin, I might just let you live. Flee this place before I change my mind!~ */ GOTO 2
  IF ~  ReputationLT(Player1,8)
~ THEN REPLY #210797 /* ~That "thing" was a doppelganger, just like you... Out of respect for the face you wear, mirrorkin, I might just let you live. Flee this place before I change my mind!~ */ GOTO 3
  IF ~  ReputationLT(Player1,8)
~ THEN REPLY #210802 /* ~It's a long story, Arkanis, and I have no time to tell it to you. Begone before you get the same as Dreppin!~ */ GOTO 2
END
