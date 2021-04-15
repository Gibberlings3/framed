// creator  : C:\Users\Laurie\NearInfinity\NearInfinity.jar (v2.1-20200901)
// game     : C:\Users\Laurie\Beamdog Library\BG1 Framed
// resource : ALANBL.DLG
// source   : data\DIALOG.BIF
// dialog   : Lang\en_US\dialog.tlk
// dialogF  : (none)

BEGIN ~ALANBL~

IF ~  True()
~ THEN BEGIN 0 // from:
  SAY #9720 /* ~Here there, you look a bit hard pressed for a place to rest. Care to chat a spell before slinking off into the night? I think I saw you about the Thieves' Guild before. I canna remember your name, but any friend is a good friend if you're running out of them. Eh? What say you?~ */
  IF ~~ THEN REPLY #9721 /* ~Thanks, but why would you be running out of friends?~ */ GOTO 1
  IF ~~ THEN REPLY #9722 /* ~I don't know you. Sod off!~ */ GOTO 3
  IF ~~ THEN REPLY #9723 /* ~The Thieves' Guild! I would never associate myself with them!~ */ GOTO 4
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY #9724 /* ~Ah, Baldur's Gate is nearly a jail itself in these times, but that doesn't stop the guard from locking you away for the slightest reason. The entire city is on edge, and every member of the Flaming Fist is out for blood. Can't say that I blame them. I would be right upset if I was in their shoes. Scar, their second-in-command, was killed recently. Don't really know the circumstances—some say it was accident, some say murder—but it has only served to increase tensions. Especially since Duke Entar Silvershield was assassinated. No guesswork as to what happened there.~ */
  IF ~~ THEN REPLY #9725 /* ~Who could have done such a thing?~ */ GOTO 2
  IF ~~ THEN REPLY #9726 /* ~What will the Flaming Fist do without effective leadership?~ */ GOTO 5
END

IF ~~ THEN BEGIN 2 // from: 1.0 4.0
  SAY #9727 /* ~Oh, any number of people, really. The question is, who would have the motive? Fingers are pointing all over. Odds-on favorite is the same person who killed those merchants in Candlekeep, though no one seems to have a concrete reason. I would wager that the other Dukes are in some measure of peril as well, though Duke Eltan is close to death already. Some sort of wasting disease, though it defies curing. Hard to imagine an honest sickness that cannot be cured in this day and age.~ */
  IF ~~ THEN REPLY #9754 /* ~Are you saying that it is not a natural disease?~ */ GOTO 8
END

IF ~~ THEN BEGIN 3 // from: 0.1
  SAY #9728 /* ~It would seem I have made an error. You are no more a friend of mine than the guards themselves. If we meet again I shall not be so trusting, or so lightly armed.~ */
  IF ~~ THEN DO ~EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 4 // from: 0.2
  SAY #9729 /* ~You needn't keep up the pretense with me. I'm in no position to be blowing the whistle on any of my fellow sneaksmen. Fine. If you don't want your nature known, so be it. I can't really blame you, what with the Flaming Fist rounding up roustabouts like there was no tomorrow. I know their leader is ill and their second-in-command is dead, but is that any excuse for rough treatment? Perhaps it is, especially since Duke Entar Silvershield was killed.~ */
  IF ~~ THEN REPLY #9734 /* ~Who could have done such a thing?~ */ GOTO 2
  IF ~~ THEN REPLY #9736 /* ~What will the Flaming Fist do without effective leadership?~ */ GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 1.1 4.1
  SAY #9737 /* ~They still have leadership. How effective it is, I do not know. I hear Angelo Dosan is now effectively in control. Such a weasel he is. I am surprised he has the support of the troops. He's got powerful friends though, and I hear that he takes orders straight from Sarevok. You've heard of him, right? With Entar dead, the other Dukes have called an emergency election. Sarevok is the frontrunner, and his stand against Amn is very popular. Imagine how much pull he will have if he actually has the Flaming Fist in his back pocket.~ */
  IF ~~ THEN REPLY #9745 /* ~Duke Eltan would never stand by and let someone take control of the Flaming Fist.~ */ GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 5.0
  SAY #9751 /* ~Duke Eltan is in no position to prevent it. As I understand it, he is barely clinging to life. No one seems to be able to help him, even though he is attended around the clock by a healer named Rashad. You didn't hear this from me, but I've a few friends that know of this Rashad. Let's just say that I do not put much faith in Duke Eltan surviving the week.~ */
  IF ~~ THEN REPLY #9752 /* ~You have information such as this, and you tell no one?~ */ GOTO 7
END

IF ~~ THEN BEGIN 7 // from: 6.0 8.0
  SAY #9753 /* ~As if anyone would believe an old sneak-thief like me. What are my words without proof? If somebody truly wanted to look into this matter, they would have to investigate at the Flaming Fist Headquarters itself. I ain't setting foot in such a place. If you've the will, you go do it.~ */
  IF ~~ THEN DO ~EscapeArea()
~ UNSOLVED_JOURNAL #26812 /* ~The Rise of Sarevok
Baldur's Gate is nearly a jail in these times. The entire city is on edge, and every member of the Flaming Fist is out for blood. Scar, their second-in-command, was killed recently, and Duke Entar Silvershield was assassinated. Angelo Dosan is now effectively in control of the Flaming Fist, though no one seems to trust him. He's got powerful friends, though, and I hear that he takes orders straight from Sarevok. Duke Eltan, the real head of the Flaming Fist, is barely clinging to life. No one seems to be able to help him, even though he is attended at all times by a healer named Rashad. With Entar dead and Eltan ill, the other Dukes have called an emergency election. Sarevok is the frontrunner, and his stand against Amn is very popular. Confronting him directly will have to wait until I have concrete proof to present, since no one would take my word over his. Perhaps I might have more luck investigating Angelo at the Flaming Fist headquarters.~ */ EXIT
END

IF ~~ THEN BEGIN 8 // from: 2.0
  SAY #9755 /* ~I would say nothing of the sort where another ear could hear it. If Dukes are to be killed with impunity, what chance would I stand? It is simply a curious development that Eltan would fall ill at such a time and that Angelo Dosan would step into his place with such vigor. He does not seem the ambitious sort, that Angelo, though Sarevok may have instilled a more predatory instinct in him. Sarevok has that effect, I hear, and he is supposedly working quite close with this acting head of the Flaming Fist, Angelo.~ */
  IF ~~ THEN REPLY #9756 /* ~You have information such as this, and you tell no one?~ */ GOTO 7
END
