// creator  : C:\Users\Laurie\NearInfinity\NearInfinity.jar (v2.1-20200901)
// game     : C:\Users\Laurie\Beamdog Library\BG1 Test
// resource : IRONM4.DLG
// source   : data\DIALOG.BIF
// dialog   : Lang\en_US\dialog.tlk
// dialogF  : (none)

BEGIN ~IRONM4~

IF ~  NumberOfTimesTalkedTo(0)
~ THEN BEGIN 0 // from:
  SAY #7662 /* ~So, what can I help you with?~ */
  IF ~~ THEN REPLY #7672 /* ~We were sent here with the understanding that you did all of the hiring for the Iron Throne.~ */ GOTO 1
  IF ~~ THEN REPLY #7673 /* ~We're looking for the leaders of the Iron Throne.~ */ GOTO 2
  IF ~~ THEN REPLY #7674 /* ~We're the mercenaries who've been messing up all your operations these past weeks. Tell us everything you know or we'll kill you where you stand!~ */ GOTO 5
END

IF ~~ THEN BEGIN 1 // from: 0.0 2.2
  SAY #7663 /* ~I apologize. Someone has made a mistake; we are hiring no one at the moment. I hope there hasn't been too much inconvenience, but could you please leave now?~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2 // from: 0.1
  SAY #7664 /* ~And why would you be looking for them? Might I ask you who you are and what you're doing here?~ */
  IF ~~ THEN REPLY #7675 /* ~We're merchants in from Sembia. We have important news for your leader.~ */ GOTO 3
  IF ~~ THEN REPLY #7676 /* ~We're merchants. We have just arrived from Cormyr, and have important news for your leader.~ */ GOTO 4
  IF ~~ THEN REPLY #7677 /* ~We're mercenaries looking for a job. We were told that you were the person to talk to.~ */ GOTO 1
END

IF ~~ THEN BEGIN 3 // from: 2.0
  SAY #7665 /* ~Well, Rieltar isn't here right now. I'd suggest you find an inn and wait for his return from Candlekeep.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 4 // from: 2.1
  SAY #7666 /* ~From Cormyr? That is most interesting, considering that the Iron Throne is banned from operating there. What I really think is that you're spies. GUARDS!~ */
  IF ~~ THEN DO ~CreateCreature("IRONGU",[936.836],S)
CreateCreature("IRONGU",[936.836],S)
CreateCreature("IRONGU",[936.836],S)
EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 5 // from: 0.2
  SAY #7667 /* ~Wait! Don't kill me please! What do you want to know? I'll tell you anything.~ */
  IF ~~ THEN REPLY #7678 /* ~Where are your leaders?~ */ GOTO 6
  IF ~~ THEN REPLY #7679 /* ~What are the Iron Throne's plans?~ */ GOTO 7
  IF ~~ THEN REPLY #7680 /* ~Where are the offices of your leader?~ */ UNSOLVED_JOURNAL #27174 /* ~Investigating the Iron Throne
The offices of the Iron Throne leaders are on the fifth floor of the building.~ */ GOTO 8
END

IF ~~ THEN BEGIN 6 // from: 5.0
  SAY #7668 /* ~They—they're at Candlekeep, at some important conference.~ */
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 7 // from: 5.1
  SAY #7669 /* ~I couldn't tell you that. I'm not privy to that kind of information. You-you'd have to ask Rieltar, Brunos, or Thaldorn.~ */
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 8 // from: 5.2
  SAY #7670 /* ~It's located on the fifth floor.~ */
  IF ~~ THEN GOTO 9
END

IF ~~ THEN BEGIN 9 // from: 6.0 7.0 8.0
  SAY #7671 /* ~Please leave, I promise not to tell anyone you're here.~ */
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 10 // from:
  SAY #7681 /* ~Do you mind? I'm a very busy man, and I don't need these constant interruptions.~ */
  IF ~~ THEN EXIT
END

IF ~  StateCheck(Myself,STATE_CHARMED)
~ THEN BEGIN 11 // from:
  SAY #7685 /* ~If you're looking for Rieltar and Brunos, you'd find them at Candlekeep. There's some sort of clandestine rendezvous at the library.~ */
  IF ~~ THEN JOURNAL #7686 /* ~A charmed merchant told us that the leaders of the Iron Throne were at Candlekeep.~ */ EXIT
END

IF ~~ THEN BEGIN 12 // from:
  SAY #9208 /* ~You're not welcome here! Get out or be thrown out!~ */
  IF ~~ THEN EXIT
END
