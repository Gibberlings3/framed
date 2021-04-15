// creator  : C:\Users\Laurie\NearInfinity\NearInfinity.jar (v2.1-20200901)
// game     : C:\Users\Laurie\Beamdog Library\BG1 Test
// resource : THALDO.DLG
// source   : data\DIALOG.BIF
// dialog   : Lang\en_US\dialog.tlk
// dialogF  : (none)

BEGIN ~THALDO~
//////////////////////////////////////////////////
// WARNING: this file contains non-trivial WEIGHTs
//////////////////////////////////////////////////

IF WEIGHT #1 /* Triggers after states #: 5 even though they appear after this state */
~  NumberOfTimesTalkedTo(0)
~ THEN BEGIN 0 // from:
  SAY #1459 /* ~What are you doing here?! Get out of this building before I call the guards.~ */
  IF ~~ THEN REPLY #1477 /* ~We can't do that until you answer some questions.~ */ GOTO 1
  IF ~~ THEN REPLY #1478 /* ~Sure, if you want us to leave, we'll leave.~ */ DO ~EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #1460 /* ~You're here to kill me, aren't you? You can't kill me! Do you know who I am? I'm Thaldorn, one of the leaders of the Iron Throne.~ */
  IF ~~ THEN REPLY #1479 /* ~You're too much of a whiner, I think we're going to have to kill you.~ */ GOTO 3
  IF ~~ THEN REPLY #1480 /* ~Could you just tell us where the other leaders of the Iron Throne are located? If you do, we'll spare your miserable life.~ */ UNSOLVED_JOURNAL #27479 /* ~Investigating the Iron Throne
When we threatened Thaldorn, he told us that Rieltar and Brunos, his business partners, are at Candlekeep.~ */ GOTO 2
  IF ~~ THEN REPLY #1481 /* ~Where can we find documents that will implicate your organization for its involvement with the bandit raids and iron shortage? Tell us or die.~ */ GOTO 3
END

IF ~~ THEN BEGIN 2 // from: 1.1 3.0
  SAY #1461 /* ~The other leaders, Brunos and Rieltar, they're at Candlekeep, attending business with some benefactors from the south. Will you let me go now, please?~ */
  IF ~~ THEN REPLY #1482 /* ~First, tell us where we can find hard evidence that could implicate your business in all of the deviltry going on along the Coast Way.~ */ GOTO 3
  IF ~~ THEN REPLY #1483 /* ~You're free to go.~ */ DO ~EscapeArea()
~ EXIT
  IF ~~ THEN REPLY #1484 /* ~Sorry, we can't let you live, you know too much.~ */ GOTO 4
END

IF ~~ THEN BEGIN 3 // from: 1.0 1.2 2.0
  SAY #1462 /* ~Please don't hurt me! You can find everything you need with Rieltar, he's the true leader of the operation. He always carries everything on his person. Am I free to go?~ */
  IF ~~ THEN REPLY #1485 /* ~If you tell us where the leaders of the Iron Throne are located, we might let you go free.~ */ UNSOLVED_JOURNAL #27479 /* ~Investigating the Iron Throne
When we threatened Thaldorn, he told us that Rieltar and Brunos, his business partners, are at Candlekeep.~ */ GOTO 2
  IF ~~ THEN REPLY #1486 /* ~Get outta here.~ */ DO ~EscapeArea()
~ EXIT
  IF ~~ THEN REPLY #1487 /* ~Sorry, but you're going to have to die.~ */ GOTO 4
END

IF ~~ THEN BEGIN 4 // from: 2.2 3.2
  SAY #1463 /* ~NOOOOoooooo. Please, please let me live.~ */
  IF ~~ THEN REPLY #1488 /* ~Wow, I've never seen such a complete lack of dignity. For giving us such a good show, you're free to go.~ */ DO ~EscapeArea()
~ EXIT
  IF ~~ THEN REPLY #1489 /* ~You're still a dead man, Thaldorn.~ */ DO ~Enemy()
~ EXIT
END

IF WEIGHT #0 ~  StateCheck(Myself,STATE_CHARMED)
~ THEN BEGIN 5 // from:
  SAY #6072 /* ~I'm one of the western divisional leaders of the Iron Throne. The others are at Candlekeep negotiating with the Knights of the Shield. We have been creating a misinformation campaign to blame the Zhentarim for all the troubles in the region. We are trying to create tensions between the governments of Baldur's Gate and Amn. With iron being the most important resource in a war, the Baldurian government will have to go to us in order to get any. We have disrupted all iron trade through the region using the Blacktalon mercenaries and the Chill. The only known iron mine in the region is at Nashkel, and we have effectively crippled that mine. We have our own mine operating in Cloakwood. When the Baldurian government comes to us for iron, we will be able to make exorbitant trading demands, and thus become the preeminent trading power in this region.~ */
  IF ~~ THEN JOURNAL #27480 EXIT
END

IF ~~ THEN BEGIN 6 // from:
  SAY #9073 /* ~Leave me be or you'll regret it!~ */
  IF ~~ THEN EXIT
END
