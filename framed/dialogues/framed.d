////////////////////////////////////////////////////
// Dialogue changes needed for the main component //
////////////////////////////////////////////////////

REPLACE_SAY ALANBL 2 @2000

ADD_STATE_TRIGGER ARKANI3 0 ~Global("Teth","GLOBAL",1)~
ADD_TRANS_TRIGGER ARKANI3 0 ~Global("Chapter","GLOBAL",6)~ DO 0 1 2 3 %FIX_GREY%
EXTEND_BOTTOM ARKANI3 0
	IF ~Global("Chapter","GLOBAL",5)~ THEN REPLY @2128 /* ~I would venture to guess, that was a doppleganger. I hate to think what foul plan was afoot.~ */ GOTO SMASH
END
APPEND ARKANI3
	IF ~~ BEGIN SMASH
		SAY @2129	= ~Whatever their plan, let's smash it together!~
		IF ~~ THEN REPLY @2130 /* ~I'd prefer you alerted Tethoril and the Gatewarden to the danger.  I'll take care of the dopplegangers.~ */ GOTO BYEBYE
		IF ~~ THEN REPLY @2131 /* ~Your help is most welcome!~ */ GOTO LEADON
	END
	
	IF ~~ BEGIN LEADON
		SAY @2132 /* ~Aye, child, lead on!~ */
		IF ~~ EXIT
	END
	
	IF ~~ BEGIN BYEBYE
		SAY @2133 /* ~As you order, so shall it be, my old comrade. Come, Deder... <CHARNAME> has spoken.~ */
		IF ~~ DO ~ActionOverride("DEDER",EscapeArea()) EscapeArea()~ EXIT
	END
	
	IF ~GlobalGT("Teth","GLOBAL",1) Global("Chapter","GLOBAL",5)~ BEGIN GREETINGS
		SAY @2142 // ~Darn glad you were here to clear out those catacombs! Who knows what would've happend...~
		IF ~~ DO ~EscapeArea()~ EXIT
	END
END

ALTER_TRANS BART6
	BEGIN 0 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",5)~ END
EXTEND_TOP BART6 0
	IF ~Global("Chapter","GLOBAL",6)~ REPLY #%REPLY_BART6_SEMBIA% GOTO THEYRE_UPSTAIRS
END
APPEND BART6
	IF ~~ BEGIN THEYRE_UPSTAIRS
		SAY @2013 // ~Out of Sembia, eh? Well, if ye're looking for Rieltar or Brunos, you can find them just upstairs. But they're in an important meeting and might not take kindly to being disturbed.~
		IF ~~ EXIT
	END
END

APPEND BENTLY
	IF WEIGHT #-2 ~IsGabber(Player1) Global("Chapter","GLOBAL",5) Global("HelpEltan","GLOBAL",0) Global("#L_FWorkOrder","GLOBAL",0)~ BEGIN WORK_ORDER
		SAY @2100 // ~Excuse me, <SIRMAAM>. Folks from Candlekeep were here looking for you.  They wanted me to give this to you if I saw you.~
		IF ~~ DO ~SetGlobal("#L_FWorkOrder","GLOBAL",1) GiveItemCreate("#LF_CKWO",LastTalkedToBy(Myself),1,0,0)~ UNSOLVED_JOURNAL @3001 EXIT
	END
	IF WEIGHT #-1 ~!IsGabber(Player1) Global("Chapter","GLOBAL",5) Global("HelpEltan","GLOBAL",0) Global("#L_FWorkOrder","GLOBAL",0)~ BEGIN WORK_ORDER
		SAY @2101 // ~Excuse me, <SIRMAAM>. Folks from Candlekeep were here looking for <CHARNAME>.  They wanted me to give this to <PRO_HIMHER> if I saw <PRO_HIMHER>.~
		IF ~~ DO ~SetGlobal("#L_FWorkOrder","GLOBAL",1) GiveItemCreate("#LF_CKWO",LastTalkedToBy(Myself),1,0,0)~ UNSOLVED_JOURNAL @3001 EXIT
	END
END

REPLACE_SAY CYTHAN 0 @2029
APPEND CYTHAN
	IF WEIGHT #-2 ~Global("#LF_Accused","GLOBAL",1) NumInParty(1)~ BEGIN ACCUSE_YOU_1
		SAY @2202 // ~There <PRO_HESHE> is! <PROPER_HESHE> is the one that killed Rieltar and Brunos!~
		IF ~~ DO ~SetGlobal("#LF_Accused","GLOBAL",2) StartCutSceneMode() StartCutScene("#LF_Ch7")~ EXIT
	END
	
	IF WEIGHT #-2 ~Global("#LF_Accused","GLOBAL",1) !NumInParty(1)~ BEGIN ACCUSE_YOU_1
		SAY @2201 // ~There they are!  Those are the ones that killed Rieltar and Brunos!~
		IF ~~ DO ~SetGlobal("#LF_Accused","GLOBAL",2) StartCutSceneMode() StartCutScene("#LF_Ch7")~ EXIT
	END
END

ADD_TRANS_TRIGGER DELTAN 6 ~GlobalGT("Teth","GLOBAL",1)~ 16 DO 0
EXTEND_BOTTOM DELTAN 6
	IF ~ReputationGT(Player1,5) GlobalLT("Teth","GLOBAL",2)~ THEN REPLY #%REPLY_ELTAN_OK% /* ~We'll be back as soon as possible.~ */ DO ~SetGlobal("HelpEltan","GLOBAL",1) EraseJournalEntry(%JOURNAL_IRON_THRONE1%) EraseJournalEntry(%JOURNAL_IRON_THRONE2%) AddJournalEntry(%JOURNAL_IRON_THRONE3%,QUEST) ActionOverride("SCAR",EscapeArea())~ UNSOLVED_JOURNAL #%JOURNAL_IRON_THRONE4% GOTO TAKE_WO
END
ADD_STATE_TRIGGER DELTAN 7 ~Global("Chapter","GLOBAL",5)~
EXTEND_BOTTOM DELTAN 16
	IF ~GlobalLT("Teth","GLOBAL",2)~ THEN DO ~SetGlobal("HelpEltan","GLOBAL",1) EraseJournalEntry(%JOURNAL_IRON_THRONE1%) EraseJournalEntry(%JOURNAL_IRON_THRONE2%) AddJournalEntry(%JOURNAL_IRON_THRONE3%,QUEST) ActionOverride("SCAR",EscapeArea())~ UNSOLVED_JOURNAL #%JOURNAL_IRON_THRONE4% GOTO TAKE_WO
END
APPEND DELTAN
	IF ~~ BEGIN TAKE_WO
		SAY @2200 // ~Oh, by the way, we received a messenger from Candlekeep. They managed to clear enough of the spiders for their purposes. You'll not be needing that work order any more.~
		IF ~~ DO ~TakePartyItem("#LF_CKWO") DestroyItem("#LF_CKWO") EraseJournalEntry(@3001)~ EXIT
	END
END

REPLACE_SAY DELTHY 3 @2004
REPLACE_SAY DELTHY 5 @2005
REPLACE_SAY DELTHY 8 @2006

ADD_STATE_TRIGGER DIARMID 0 ~Global("Chapter","GLOBAL",6)~
APPEND DIARMID
	IF ~Global("Chapter","GLOBAL",5)~ BEGIN NOT_PRAT
		SAY @2134 // ~Where you going Prat? You can't possibly be finished already...it is Prat, isn't it?  Wait! You ain't Prat!~
		IF ~~ THEN REPLY @2135 /* ~Stay where you are, I have questions.~ */ GOTO NO_CHANCE
	END
	
	IF ~~ BEGIN NO_CHANCE
		SAY @2136 // ~No chance, buddy!~
		IF ~~ DO ~EscapeArea()~ EXIT
	END
END

ALTER_TRANS DIVINE
	BEGIN 7 END
	BEGIN 0 END
	BEGIN "JOURNAL" ~~ END
	
ALTER_TRANS DREPPI2
	BEGIN 0 END
	BEGIN 2 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",6)~ END
EXTEND_BOTTOM DREPPI2 0
	IF ~Global("Chapter","GLOBAL",5)~ THEN REPLY #%REPLY_DREPPIN_BIG% GOTO WE_BIG
END
ALTER_TRANS DREPPI2
	BEGIN 1 END
	BEGIN 1 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",6)~ END
EXTEND_BOTTOM DREPPI2 1
	IF ~Global("Chapter","GLOBAL",5)~ THEN REPLY #%REPLY_DREPPIN_THRONE% GOTO SOME_FOLKS
END
APPEND DREPPI2
	IF ~~ BEGIN WE_BIG
		SAY @2105 // ~Yeah, people come from all over to see the books here. All sorts of folks, too: bards, nobles, priests, mages. Volo's even been here and Elminster, too, remember. You never know, maybe even ol' Drizzt will come to visit some day.~
		IF ~~ EXIT
	END
	
	IF ~~ BEGIN SOME_FOLKS
		SAY @2104 /* ~That's terrible!  What some folks won't do just for a bit of extra gold!~ */
		IF ~~ EXIT
	END
END

ADD_TRANS_ACTION FFHUNT BEGIN 5 END BEGIN 0 END ~Shout(99)~ 

REPLACE_SAY FLAMAL 2 @2012

REPLACE_SAY FLAMC7 7 @2001
REPLACE_SAY FLAMC7 13 @2002

REPLACE_SAY FTOWBAZ 6 @2024

ADD_TRANS_TRIGGER FULLER2 0 ~Global("Chapter","GLOBAL",6)~ DO 2
EXTEND_BOTTOM FULLER2 0
	IF ~Global("Chapter","GLOBAL",5)~ REPLY #%REPLY_FULLER_THRONE% GOTO IRON_THRONE
END
APPEND FULLER2
	IF ~~ BEGIN IRON_THRONE
		SAY @2107 // ~The Iron Throne? My, you do have your hands full. You be careful, you hear.~
		IF ~~ EXIT
	END
END

%GARRICK_BG1NPC_CHANGES%

ADD_STATE_TRIGGER GATEWA2 0 ~Global("Chapter","GLOBAL",6)~ 1 2 6
APPEND GATEWA2
	IF ~Global("Chapter","GLOBAL",5) OR(2) Global("Teth","GLOBAL",0) Global("#LF_GWThank","MYAREA",1)~ BEGIN WELCOME_BACK
		SAY @2140 // ~Welcome home, <CHARNAME>. It's good to see you again.~
		IF ~~ EXIT
	END
	
	IF ~Global("Chapter","GLOBAL",5) !Global("Teth","GLOBAL",0) Global("#LF_GWThank","MYAREA",0)~ BEGIN THANK_YOU
		SAY @2141 // ~You've done a good thing here, <CHARNAME>. It won't be forgotten.~
		IF ~~ DO ~SetGlobal("#LF_GWThank","MYAREA",1)~ EXIT
	END

	IF ~~ BEGIN PATROL
		SAY @2150 // ~And we will patrol the area regularly to make sure it remains sealed, forever.~
		IF ~~ EXTERN TETHTO2 WRAP_3
	END
END

REPLACE_SAY GREGOR 1 @2027

ADD_TRANS_TRIGGER HULL2 2 ~Global("Chapter","GLOBAL",6)~ DO 1

REPLACE_SAY HUSAM 18 @2009
REPLACE_SAY HUSAM 25 @2010
ALTER_TRANS HUSAM
	BEGIN 5 13 END
	BEGIN 0 END
	BEGIN "JOURNAL" ~@3000~ END

REPLACE_SAY HUSAM2 0 @2009
REPLACE_SAY HUSAM2 6 @2010

ADD_STATE_TRIGGER IRONM3 0 ~Global("Chapter","GLOBAL",5)~
APPEND IRONM3
	IF WEIGHT #-1 ~NumberOfTimesTalkedTo(0) Global("Chapter","GLOBAL",6)~ BEGIN THEYRE_UPSTAIRS
		SAY @2014 // ~Ahhh look, some newcomers. I assume that the lot of you has just arrived with new supplies from Ordulin. If you're looking for Rieltar or Brunos, they're just upstairs, but they're in important negotiations.~
		IF ~~ EXIT
	END
END

ADD_TRANS_TRIGGER IRONM4 2 ~GLOBAL("Chapter","GLOBAL",5)~ 5 DO 0
ADD_STATE_TRIGGER IRONM4 11 ~GLOBAL("Chapter","GLOBAL",5)~
EXTEND_TOP IRONM4 2
	IF ~Global("Chapter","GLOBAL",6)~ THEN REPLY #%REPLY_IRONM4_SEMBI% GOTO THEYRE_UPSTAIRS_1
END
EXTEND_TOP IRONM4 5
	IF ~Global("Chapter","GLOBAL",6)~ THEN REPLY #%REPLY_IRONM4_SEMBI% GOTO THEYRE_UPSTAIRS_2
END
APPEND IRONM4
	IF ~~ BEGIN THEYRE_UPSTAIRS_1
		SAY @2011 // ~Well, friends, if you want to meet the leaders of the Iron Throne, you can find them on the top floor. But they're in an important meeting and don't want to be disturbed.~
		IF ~~ EXIT
	END

	IF ~~ BEGIN THEYRE_UPSTAIRS_2
		SAY @2017 // ~They—they're upstairs, preparing for some important conference.~
		IF ~~ THEN GOTO 9
	END

	IF ~StateCheck(Myself,STATE_CHARMED) Global("Chapter","GLOBAL",6)~ THEN BEGIN CHARMED
		SAY #2011
		IF ~~ THEN EXIT
	END
END

ALTER_TRANS IRONME
	BEGIN 1 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",5)~ END
EXTEND_BOTTOM IRONME 1
	IF ~Global("Chapter","GLOBAL",6)~ REPLY #%REPLY_WHERE_LEADERS_1% GOTO THEYRE_UPSTAIRS
END
ADD_STATE_TRIGGER IRONME 3 ~Global("Chapter","GLOBAL",5)~
APPEND IRONME
	IF ~~ BEGIN THEYRE_UPSTAIRS
		SAY @2011 // ~Well, friends, if you want to meet the leaders of the Iron Throne, you can find them on the top floor. But they're in an important meeting and don't want to be disturbed.~
		IF ~~ EXIT
	END

	IF WEIGHT #-1 ~StateCheck(Myself,STATE_CHARMED) Global("Chapter","GLOBAL",6)~ BEGIN CHARMED
		SAY @2011 // ~Well, friends, if you want to meet the leaders of the Iron Throne, you can find them on the top floor. But they're in an important meeting and don't want to be disturbed.~
		IF ~~ EXIT
	END
END

ADD_TRANS_TRIGGER KARAN 0 ~Global("Chapter","GLOBAL",6)~ DO 0
ADD_TRANS_TRIGGER KARAN 1 ~Global("Chapter","GLOBAL",6)~ DO 0 1
EXTEND_BOTTOM KARAN 1
	IF ~Global("Chapter","GLOBAL",5)~ THEN REPLY @2113 /* ~Spiders Karan, enormous spiders! I'm just having some fun with you. I should have no trouble with them.~ */ GOTO WELCOME_BACK
END
APPEND KARAN
	IF ~~ BEGIN WELCOME_BACK
		SAY @2114 // ~You rapscallion! This place hasn't been the same since the day you left.  Welcome back.~
		IF ~~ DO ~EscapeArea()~ EXIT
	END
END

APPEND KEEPER
	IF WEIGHT #-3 ~PartyHasItem("#LF_CKWO") Global("Chapter","GLOBAL",5)~ BEGIN WELCOME_BACK_1
		SAY @2103 // ~Welcome back, <CHARNAME>.  Tethoril told me to expect you.  ...
		IF ~~ DO ~TakePartyItem("#LF_CKWO") SetGlobal("bd_allow_rest","MYAREA",1) SetGlobal("#LF_AllowCKEntry","GLOBAL",1) SetGlobal("#LF_KPInKeep","MYAREA",1) SetGlobal("#LF_PCInKeep","GLOBAL",1) ClearAllActions() StartCutSceneMode() ActionOverride(Player1,JumpToPoint([4174.2521]) ActionOverride(Player2,JumpToPoint([4174.2521])) ActionOverride(Player3,JumpToPoint([4174.2521])) ActionOverride(Player4,JumpToPoint([4174.2521])) ActionOverride(Player5,JumpToPoint([4174.2521])) ActionOverride(Player6,JumpToPoint([4174.2521])) JumpToPoint([4280.2398]) MoveViewPoint([4174.2521],INSTANT) MultiPlayerSync() EndCutSceneMode()~ UNSOLVED_JOURNAL @3002 EXIT
	END

	IF WEIGHT #-2 ~Global("#LF_AllowCKEntry","GLOBAL",1) Global("#LF_KPInKeep","MYAREA",0)~ BEGIN WELCOME_BACK_2
		SAY @2126 // ~Welcome back, <CHARNAME>.  Go right in.~
		IF ~~ DO ~SetGlobal("bd_allow_rest","MYAREA",1) SetGlobal("#LF_KPInKeep","MYAREA",1) SetGlobal("#LF_PCInKeep","GLOBAL",1) ClearAllActions() StartCutSceneMode() ActionOverride(Player1,JumpToPoint([4174.2521]) ActionOverride(Player2,JumpToPoint([4174.2521])) ActionOverride(Player3,JumpToPoint([4174.2521])) ActionOverride(Player4,JumpToPoint([4174.2521])) ActionOverride(Player5,JumpToPoint([4174.2521])) ActionOverride(Player6,JumpToPoint([4174.2521])) JumpToPoint([4280.2398]) MoveViewPoint([4174.2521],INSTANT) MultiPlayerSync() EndCutSceneMode()~ EXIT
	END

	IF WEIGHT #-1 ~Global("#LF_AllowCKEntry","GLOBAL",1) Global("#LF_KPInKeep","MYAREA",1)~ BEGIN SEE_YA
		SAY @2127 // ~Come back soon, <CHARNAME>.~
		IF ~~ DO ~SetGlobal("#LF_KPInKeep","MYAREA",0) SetGlobal("#LF_PCInKeep","GLOBAL",0) ClearAllActions() StartCutSceneMode() ActionOverride(Player1,JumpToPoint([4697.2849]) ActionOverride(Player2,JumpToPoint([4648.2827])) ActionOverride(Player3,JumpToPoint([4713.2802])) ActionOverride(Player4,JumpToPoint([4599.2802])) ActionOverride(Player5,JumpToPoint([4660.2777])) ActionOverride(Player6,JumpToPoint([4713.2750])) JumpToPoint([4522.2650]) MoveViewPoint([4697.2849],INSTANT) MultiPlayerSync() EndCutSceneMode()~ EXIT
	END
END

REPLACE_SAY KOLVAR 6 @2007
REPLACE_SAY KOLVAR 10 @2008

REPLACE_SAY LAUDEN 2 @2019

REPLACE_SAY NOBLBA 3 @2003

REPLACE_SAY NOBLBAZ 3 @2021
REPLACE_SAY NOBLBAZ 5 @2022
REPLACE_SAY NOBLBAZ 9 @2023

REPLACE_SAY NOBWBAZ 5 @2022
REPLACE_SAY NOBWBAZ 9 @2025

ADD_STATE_TRIGGER PARDA 0 ~Global("Chapter","GLOBAL",6)~
APPEND PARDA
	IF ~Global("Chapter","GLOBAL",5)~ BEGIN SPIDERS
		SAY @2106 // ~Oh, <CHARNAME>, I heard you had returned! I'm so glad you're here to take care of the catacombs. Make sure you have plenty of protections from poison. Those spiders are dreadful.~
		IF ~~ DO ~EscapeArea()~ EXIT
	END
END

ADD_TRANS_TRIGGER PIATO 1 ~Global("Chapter","GLOBAL",6)~ 2 3 DO 0
EXTEND_BOTTOM PIATO 1 2 3
	IF ~Global("Chapter","GLOBAL",5)~ DO ~MoveToPoint([635.1106])~ EXIT
END

ADD_STATE_TRIGGER POGHM10 2 ~Global("Chapter","GLOBAL",6)~ 3 4
APPEND POGHM10
	IF ~Global("Chapter","GLOBAL",5) OR(3) RandomNum(7,3) RandomNum(7,4) RandomNum(7,5)~ BEGIN WELCOME_BACK
		SAY @2115 // ~Welcome back, <CHARNAME>. I hope the catacombs don't prove to be too difficult for you.~
		IF ~~ EXIT
	END
END

ADD_STATE_TRIGGER PRAT 0 ~Global("Chapter","GLOBAL",6)~ 1
APPEND Prat
	IF ~Global("Chapter","GLOBAL",5)~ BEGIN WHOAREYOU
		SAY @2137 // ~Who are you?  How'd you get past our...who are you?!~
		IF ~~ THEN REPLY @2138 /* ~I could ask you about the same question!  Who are you and what are you doing here?~ */ GOTO TROUBLE
	END
	
	IF ~~ BEGIN TROUBLE
		SAY @2139 // ~Damn!  We are in so much trouble...~
		IF ~~ DO ~ActionOverride("SAKUL",Enemy()) ActionOverride("ROB",Enemy()) ActionOverride("TAM",Enemy()) ForceSpell("Shistal",DOPPLEGANGER_CHANGE_DEFAULT) ActionOverride("Shistal",Enemy()) Enemy()~ EXIT
	END
END

REPLACE_SAY R158 7 @2001
REPLACE_SAY R158 13 @2002

REPLACE_SAY RBALDU 2 @2026

REPLACE_SAY RBEREG 1 @2026

REPLACE_STATE_TRIGGER READ3 0 ~OR(2) RandomNum(3,1) Global("Chapter","GLOBAL",5)~
ADD_STATE_TRIGGER READ3 2 ~Global("Chapter","GLOBAL",6)~

REPLACE_SAY RFRIEN 1 @2026

ADD_TRANS_ACTION SCAR BEGIN 0 END BEGIN 1 END ~SetGlobal("#L_FGiveWO","MYAREA",1)~
REPLACE_TRANS_ACTION SCAR BEGIN 3 7 END BEGIN 0 END ~EscapeArea()~ ~~
APPEND SCAR
	IF WEIGHT #0 ~Global("#L_FGiveWO","MYAREA",1) Global("#L_FWorkOrder","GLOBAL",0)~ BEGIN GIVE_WORK_ORDER
		SAY @2102 // ~Folks from Candlekeep sent a messenger here looking for those that cleared out the Nashkel mines.  They wanted me to give this to you if I saw you.~
		IF ~~ DO ~SetGlobal("#L_FGiveWO","MYAREA",0) SetGlobal("#L_FWorkOrder","GLOBAL",1) GiveItemCreate("#LF_CKWO",LastTalkedToBy(Myself),1,0,0) EscapeArea()~ UNSOLVED_JOURNAL @3001 EXIT
	END
END	

ALTER_TRANS SORREL
	BEGIN 0 END
	BEGIN 0 END
	BEGIN ~REPLY~ ~@2020~ END
	
ADD_STATE_TRIGGER TETHTO2 0 ~Global("Chapter","GLOBAL",6)~
APPEND TETHTO2
	IF ~Global("Chapter","GLOBAL",5) NumberOfTimesTalkedTo(0)~ BEGIN HELLO_CH5
		SAY @2117 // ~Ah, <CHARNAME>! I'm glad you have come. We can barely step foot in the catacombs for the spiders. Are you ready to go?~
		IF ~~ REPLY @2118 /* ~Yes, I'm all set.~ */ GOTO ALL_SET
		IF ~~ REPLY @2119 /* ~Not quite yet, I'll return when I am.~ */ EXIT
	END
	
	IF ~Global("Chapter","GLOBAL",5) !NumberOfTimesTalkedTo(0) Global("Teth","GLOBAL",0)~ BEGIN HELLO_AGAIN
		SAY @2120 // ~Are you now prepared to clear out the catacombs?~
		IF ~~ REPLY @2118 /* ~Yes, I'm all set.~ */ GOTO ALL_SET
		IF ~~ REPLY @2119 /* ~Not quite yet, I'll return when I am.~ */ EXIT
	END
	
	IF ~~ BEGIN ALL_SET
		SAY @2121 // ~The entrance is warded against casual entry.  I'll need to send you to a secret room in the library that has an entrance to the catacombs. To keep the location of the entrance secret, your only exit will be through connecting tunnels that lead outside.~
		IF ~~ GOTO RETURN_WHEN_DONE
	END
	
	IF ~~ BEGIN RETURN_WHEN_DONE
		SAY @2122 // ~Return to me once you have finished clearing out the infestation and I will have your reward.~
		IF ~~ REPLY @2123 /* ~How will I get past the Keeper of the Portal?~ */ GOTO COME_AND_GO
	END
	
	IF ~~ BEGIN COME_AND_GO
		SAY @2124 // ~I have let him know you are to be able to come and go as you please until I say otherwise.~
		IF ~~ GOTO GOOD_LUCK
	END
	
	IF ~~ BEGIN GOOD_LUCK
		SAY @2125 // ~Good luck, <CHARNAME>, though I doubt you'll need it.~
		IF ~~ DO ~SetGlobal("Teth","GLOBAL",1) SetGlobal("#LF_PCInKeep","GLOBAL",0) ClearAllActions() StartCutSceneMode() StartCutScene("cuttetht")~ UNSOLVED_JOURNAL @3003 EXIT
	END
	
	IF ~Global("Chapter","GLOBAL",5) Global("Teth","GLOBAL",2)~ BEGIN WRAP_1
		SAY @2143 // ~I'm relieved to see you, young one. Arkanis told us what you found. Dopplegangers, I...I dread to think what their plan was.~
		IF ~~ THEN REPLY @2144 /* ~Whatever it was, it wasn't good.  There were duplicates of just about everyone down there.~ */ GOTO WRAP_2
	END
	
	IF ~~ BEGIN WRAP_2
		SAY @2145 // ~We will reseal the entrance into the caverns beneath the keep. Someone must have discovered how to remove the wards.~
		IF ~~ GOTO WRAP_3
		IF ~TriggerOverride(Player1,InMyArea("GATEWA2")) IsActive("GATEWA2") !Dead("GATEWA2")~ EXTERN GATEWA2 PATROL
	END
	
	IF ~~ BEGIN WRAP_3
		SAY @2146 // ~And now for your reward.  The 2,000 gold we offered you to clear out the spiders is not nearly enough for what you have done for us.~
		IF ~~ DO ~GiveGoldForce(5000)~ GOTO WRAP_4
	END
	
	IF ~~ BEGIN WRAP_4
		SAY	@2147 // ~Please accept this with our thanks. You may also come and go as often as you wish. Your old room will be reserved for your sole use. We cannot thank you, enough.~
		IF ~~ GOTO WRAP_END
	END

	IF ~~ BEGIN WRAP_END
		SAY @2148 // ~Stay and browse the library for as long as you like. This is once again your home, if you so wish.~
		IF ~~ DO ~SetGlobal("Teth","GLOBAL",3)~ SOLVED_JOURNAL @3004 EXIT
		IF ~Global("#L_TethGiveScroll","GLOBAL",1) Global("X#GorionTalkingLetter","GLOBAL",0)~ DO ~SetGlobal("Teth","GLOBAL",3)~ SOLVED_JOURNAL @3004 GOTO GIVE_SCROLL
	END
	
	IF ~~ BEGIN GIVE_SCROLL
		SAY @2151 // ~And before I forget, Gorion left this among his possesions. It is addressed to you. I wanted to make sure you've seen it.~
		IF ~~ DO ~SetGlobal("#L_TethGiveScroll","GLOBAL",2) GiveItemCreate("scrl2J",Player1,0,0,0)~ EXIT
	END
	
	IF ~Global("Chapter","GLOBAL",5) Global("Teth","GLOBAL",3)~ BEGIN GREETINGS
		SAY @2149 // ~Greetings, young one.~
		IF ~~ EXIT
	END
END

ALTER_TRANS THALDO
	BEGIN 1 END
	BEGIN 1 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",5)~ END
EXTEND_TOP THALDO 1 #1
	IF ~Global("Chapter","GLOBAL",6)~ REPLY #%REPLY_WHERE_LEADERS_2% GOTO THEYRE_OVERTHERE
END
ALTER_TRANS THALDO
	BEGIN 3 END
	BEGIN 0 END
	BEGIN "TRIGGER" ~Global("Chapter","GLOBAL",5)~ END
EXTEND_TOP THALDO 3 #0
	IF ~Global("Chapter","GLOBAL",6)~ REPLY #%REPLY_WHERE_LEADERS_3% GOTO THEYRE_OVERTHERE
END
ADD_STATE_TRIGGER THALDO 5 ~Global("Chapter","GLOBAL",5)~
APPEND THALDO
	IF ~~ BEGIN THEYRE_OVERTHERE
		SAY @2015 // ~The other leaders, Brunos and Rieltar, they're in a meeting in the next room, just down the hall. Will you let me go now, please?~
		IF ~~ THEN REPLY #%REPLY_THALDO_FIRST% GOTO 3
		IF ~~ THEN REPLY #%REPLY_THALDO_GO% DO ~EscapeArea()~ EXIT
		IF ~~ THEN REPLY #%REPLY_THALDO_SORRY% GOTO 4
	END
	
	IF WEIGHT #-1 ~StateCheck(Myself,STATE_CHARMED) Global("Chapter","GLOBAL",6)~ BEGIN THALDO_CHARMED
		SAY @2016 // ~I'm one of the western divisional leaders ...
		IF ~~ THEN JOURNAL #27480 EXIT
	END
END

APPEND IF_FILE_EXISTS TICAM
	IF WEIGHT #-1 ~Global("Chapter","GLOBAL",5) AreaCheck("%Candlekeep_Library_L1%")~ BEGIN END_IT_1
		SAY @2108 // ~It is good to see you, <CHARNAME>. I really need to thank you.~
		IF ~~ GOTO END_IT_2
	END
	
	IF ~~ BEGIN END_IT_2
		SAY @2109 // ~You gave me my life back, <CHARNAME>. If we both survive the days ahead, perhaps one day in the future, we will all meet again for a drink in honor of living life.~
		IF ~~ GOTO END_IT_3
	END
	
	IF ~~ BEGIN END_IT_3
		SAY @2110 // ~Tamah and I plan to travel together to Baldur's Gate. We'll stop over at the best Inn we can afford and get to know each other again. And then? Who knows... Although, from the twinkle I yet see in her eyes when she looks at me, I suspect the future may well be delightful. As long as she's with me, my fear seems more...manageable.~
		IF ~~ GOTO END_IT_4
	END
	
	IF ~~ BEGIN END_IT_4
		SAY @2111 // ~I... wrote a letter to you, too. I wasn't sure whether we would meet again, so I did it the way I've done it the last 30 years. (laughs)~
		IF ~~ GOTO END_IT_5
	END
	
	IF ~~ BEGIN END_IT_5
		SAY @2112 // ~Farewell, <CHARNAME>. And again, thank you.~
		IF ~~ DO ~GiveItemCreate("TITOME14",[PC],1,0,0) EraseJournalEntry(@3200)EraseJournalEntry(@3201) EraseJournalEntry(@3202) EraseJournalEntry(@3203) EraseJournalEntry(@3204) EraseJournalEntry(@3205) EraseJournalEntry(@3206) EraseJournalEntry(@3207) ActionOverride("TITamah",EscapeArea()) EscapeArea()~ SOLVED_JOURNAL @3100 EXIT
	END
END

%STATE_TRIGGER_FIX_T1SAPI%

REPLACE_SAY WARNER 3 @2021

ADD_STATE_TRIGGER WATCH9 2 ~Global("Chapter","GLOBAL",6)~ 5
APPEND WATCH9
	IF ~Global("Chapter","GLOBAL",5) OR(2) RandomNum(6,3) RandomNum(6,4)~ BEGIN WELCOME_BACK
		SAY @2116 // ~Welcome home, <CHARNAME>.~
		IF ~~ EXIT
	END
END

REPLACE_SAY WIRTHI 0 @2028

