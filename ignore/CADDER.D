// creator  : C:\Users\Laurie\NearInfinity\NearInfinity.jar (v2.1-20200901)
// game     : C:\Users\Laurie\Beamdog Library\BG1 Test
// resource : CADDER.DLG
// source   : data\DIALOG.BIF
// dialog   : Lang\en_US\dialog.tlk
// dialogF  : (none)

BEGIN ~CADDER~

IF ~  True()
~ THEN BEGIN 0 // from:
  SAY #19782 /* ~Salutations, I am Cadderly, a visitor of Candlekeep like yourselves. Pardon if I seem out of sorts, but the journey has been long and treacherous and my labors age me so. May I inquire as to your name? I am certain I have seen your face before, but I cannot fully place it.~ */
  IF ~~ THEN REPLY #19789 /* ~<CHARNAME> is my name, if it is any business of yours.~ */ GOTO 2
  IF ~~ THEN REPLY #19790 /* ~I am <CHARNAME>, and I called this place home for many years.~ */ GOTO 4
  IF ~~ THEN REPLY #19791 /* ~I am sorry, but I don't have time to speak with you at the moment.~ */ GOTO 1
END

IF ~~ THEN BEGIN 1 // from: 0.2
  SAY #19797 /* ~Very well, though I am sure we have met before. Perhaps I am mistaken; I have traveled far and met many people. Well met and good day to you regardless. I hope you enjoy your visit to the library in the main keep.~ */
  IF ~~ THEN DO ~EscapeArea()
~ JOURNAL #26904 /* ~Cadderly
Today I met a man named Cadderly who thought I looked familiar, but I don't remember him.~ */ EXIT
END

IF ~~ THEN BEGIN 2 // from: 0.0
  SAY #19798 /* ~I see. Well, as it turns out, I have met you previously. Your manner has turned out far different than I would have guessed, however. I was acquainted with your foster father, as were many others, and visited him here a number of times while you grew up. His death has been mourned across the coast, and you would do well to represent his spirit in a better fashion. Treating people with respect would be a good start.~ */
  IF ~~ THEN REPLY #19799 /* ~Ah, stow your manners and civility. I've changed much, and will represent my OWN spirit as I see fit.~ */ GOTO 3
  IF ~~ THEN REPLY #19816 /* ~I must apologize for my outburst, but I have pressing concerns to attend to.~ */ GOTO 6
  IF ~~ THEN REPLY #19817 /* ~I am sorry. How were you acquainted with Gorion?~ */ GOTO 7
END

IF ~~ THEN BEGIN 3 // from: 2.0 4.1
  SAY #19801 /* ~You have Gorion's stubborn will, if not his reason. I will leave you to your tasks. There are some within the central keep who wish to speak with you, so it would be wise of you to visit there sometime.~ */
  IF ~~ THEN DO ~EscapeArea()
~ EXIT
END

IF ~~ THEN BEGIN 4 // from: 0.1
  SAY #19802 /* ~<CHARNAME>! Then I know you well, though you may be hard pressed to remember. I was last here years ago and conferred with your foster father as you were off to chores. I am not much your senior, really. I am certain you tire of hearing it, and that legion have told you the same, but Gorion was well-known to me. His death has been mourned by many.~ */
  IF ~~ THEN REPLY #19809 /* ~I do not wish to dwell on his death. I have moved on with my life, though I cherish the memories.~ */ GOTO 8
  IF ~~ THEN REPLY #19810 /* ~His death is in the past and shall remain there. I am my own person and have my own concerns.~ */ GOTO 3
  IF ~~ THEN REPLY #19814 /* ~I have received sympathy from many a person I have never met before. Who was he to receive such adulation?~ */ GOTO 5
END

IF ~~ THEN BEGIN 5 // from: 4.2
  SAY #19815 /* ~Simple respect is all that it is. Gorion did many good things for many people. When last I spoke with him I was barely acquainted with his fellows myself, but those who harp do tend to keep to themselves their affiliations. He was a longstanding member, from what I understand. Likely he said nothing to you because he wished your childhood to be as normal as possible. I suppose all parents wish this, whether the child is theirs or not. I have yet to meet anyone who made claim to achieving it though. How do you wager you have fared?~ */
  IF ~~ THEN REPLY #19828 /* ~As well as can be expected, though I have learned much about myself that perhaps was better left unknown.~ */ GOTO 9
  IF ~~ THEN REPLY #19829 /* ~As much as I would like to continue our chat, I have important matters to attend to. Forgive me, but I must go.~ */ GOTO 6
END

IF ~~ THEN BEGIN 6 // from: 2.1 5.1 7.1 8.1
  SAY #19818 /* ~As you wish. I will bother you no more. There are some within the central keep who wish to speak with you, so it would be wise of you to visit there sometime.~ */
  IF ~~ THEN DO ~EscapeArea()
~ JOURNAL #26905 /* ~Cadderly
Another visitor to Candlekeep mentioned that he knew Gorion. He said his name was Cadderly.~ */ EXIT
END

IF ~~ THEN BEGIN 7 // from: 2.2
  SAY #19819 /* ~Oh, he was a respected sage before I was old enough to lift the Tome of Universal Harmony, let alone understand a word. He knew a great deal about this world, and much of the next as well. I heard rumors of his escapades with those who harp as well, but he never spoke of such things to me. I get the feeling that he devoted most of his attentions to raising you, and gave up whatever ribald life he lived in his youth. He would not have had it any other way, though. You seem to have fared well enough for it.~ */
  IF ~~ THEN REPLY #19830 /* ~As well as can be expected, though I have learned much about myself that perhaps was better left unknown.~ */ GOTO 9
  IF ~~ THEN REPLY #19831 /* ~As much as I would like to continue our chat, I have important matters to attend to. Forgive me, but I must go.~ */ GOTO 6
END

IF ~~ THEN BEGIN 8 // from: 4.0
  SAY #19822 /* ~Perhaps that is for the best. I will speak no more of it, save to say that he was a good man. How have you fared in the time since?~ */
  IF ~~ THEN REPLY #19823 /* ~As well as can be expected, though I have learned much about myself that perhaps was better left unknown.~ */ GOTO 9
  IF ~~ THEN REPLY #19824 /* ~As much as I would like to continue our chat, I have important matters to attend to. Forgive me, but I must go.~ */ GOTO 6
END

IF ~~ THEN BEGIN 9 // from: 5.0 7.0 8.0
  SAY #19825 /* ~Would that I had a gold coin for every person I have heard say such a thing. I am sure your troubles vary greatly from my own experience, but we all have trials we must overcome. We all have a side that should not see the light of day too often. What matters is how much strength you wish to let it have. Bah, such words are better saved for classes and meditations, not for reunions. I will take my leave, though perhaps I shall see you again before I am to go. The tomes of Candlekeep are very nearly endless, and I am sure to be here for a tenday at least. There are some within the central keep who wish to speak with you, so it would be wise of you to visit there sometime. Fare well, my friend.~ */
  IF ~~ THEN DO ~EscapeArea()
~ JOURNAL #26906 /* ~Cadderly
I met an old friend of Gorion's today. Cadderly was his name, and he recognized me from his previous visits to Candlekeep. He did not appear to be much older than I am, but he seemed possessed of an understanding that defies his years. I wish I'd had the time to speak with him further.~ */ EXIT
END
