-------------------------------------------------
---                  Framed                   ---
---             pour BGEE et EET              ---
-------------------------------------------------


------------------------------------------------------------------------
GÉNÉRAL
------------------------------------------------------------------------
Ce mod nécessite BGEE ou EET.

Le mod Framed fournit 2 versions différentes pour le chapitre 6 et fait de la visite de Chateau-Suif une quête secondaire possible sans impliquer le Trône de Fer.

Si Chateau-Suif est visité avant d'avoir enquêté sur le bâtiment du Trône de Fer, Eltan aura une tâche différente à vous faire accomplir au chapitre 6.

Pour expérimenter le mod, un ordre de travail devra être obtenu auprès de "Bentley" (Auberge de Brasamical) ou de "La Balafre" (lors de la rencontre initiale uniquement et seulement si le PC admet avoir nettoyé les mines de Nashkel) au cours du chapitre 5.

------------------------------------------------------------------------
COMPATIBILITÉ
------------------------------------------------------------------------
Il n'y a pas de problème de compatibilité connu pour le moment

------------------------------------------------------------------------
INSTALLATION
------------------------------------------------------------------------
INSTALLER APRÈS BG1 NPC PROJECT (https://www.gibberlings3.net/mods/npcs/bg1npc/)
INSTALLER APRÈS BG1 ROMANTIQUE ENCOUNTERS POUR COMPLÉTER CAMRYN/TAMAH (https://www.gibberlings3.net/mods/npcs/bg-romantic-encounters/)
INSTALLER AVANT GREY THE DOG (https://www.gibberlings3.net/mods/npcs/grey-the-dog/)

L'installation à l'aide de Project Infinity (https://forums.beamdog.com/discussion/74335/project-infinity-mod-manager-for-baldurs-gate-icewind-dale-planescape-torment-and-eet) permettra de s'assurer que ce mod et les autres mods sont installés dans le bon ordre.

REMARQUE : si vous avez déjà installé ce mod, supprimez-le avant d'extraire la nouvelle version. Pour ce faire, désinstallez tous les composants précédemment installés et supprimez le dossier et les exécutables du mod. 

Lors de l'installation ou de la désinstallation, ne fermez pas la fenêtre DOS en cliquant sur le bouton X ! Au lieu de cela, appuyez sur la touche Entrée lorsqu'il cela est demandé.

IMPORTANT POUR LES INSTALLATIONS EET : EET_End devra être réinstallé après l'installation de ce mod.
 
General (Windows, Mac OS X, and Linux)

Extrayez le contenu de l'archive du mod dans le répertoire principal de votre jeu. 

Windows
Une fois l'extraction réussie, il devrait y avoir un dossier framed et un fichier setup-framed.exe dans votre dossier de jeu. Pour l'installer, il suffit de double-cliquer sur setup-framed.exe et de suivre les instructions à l'écran.
Exécutez setup-framed.exe dans votre dossier de jeu pour réinstaller, désinstaller ou modifier les composants.

Mac OS X
Le mod est compilé et installé avec WeiDU. Pour l'installer, extrayez l'archive du mod, puis copiez le contenu du dossier dans votre dossier de jeu (le dossier qui contient le fichier CHITIN.KEY). Si l'extraction est correcte, vous devriez avoir un dossier "framed", setup-framed, et setup-framed.command dans votre dossier de jeu. Pour l'installer, il suffit de double-cliquer sur setup-framed.command et de suivre les instructions à l'écran.

Linux
Extrayez le contenu du mod dans le dossier du jeu que vous souhaitez modifier. Téléchargez la dernière version de WeiDU pour Linux sur https://github.com/WeiDUorg/weidu/releases et copiez WeiDU et WeInstall dans /usr/bin. Ensuite, ouvrez un terminal et accédez à votre répertoire d'installation EET, exécutez 'tolower' et répondez Y aux deux questions. Vous pouvez éviter d'exécuter la deuxième option (linux.ini) si vous l'avez déjà exécutée une fois dans le même répertoire. Si vous n'êtes pas sûr, il est plus sûr d'exécuter tolower et de choisir les deux options.
Exécutez WeInstall framed dans votre dossier de jeu pour installer le mod. Ensuite, exécutez wine BGMain.exe et commencez à jouer. 

Si vous rencontrez des problèmes d'installation ou des bugs, veuillez poster votre rapport de bugs dans le fil de discussion du forum : https://www.gibberlings3.net/forums/topic/32638-framed-alternate-chapter-6-for-bgee-and-eet.

------------------------------------------------------------------------
CREDITS
------------------------------------------------------------------------
* BeamDog / Overhaul Games: for the Infinity Engine and inspiring this mod
* K4thos: for EET - even though it's not required for this mod, I just really like EET
* DavidW: for the lovely macros included in alter_script.tpa as well as guidance on encapsulation and immutability
* Grammarsalad, subtledoctor, grodrigues, Mike1072, and jastey: for the ideas, guidance and help on the tool that provides proper and upper case player1 pronouns (cases.tpa)
* JohnBob for the French translation
* Bubb and CamDawg - LOVE YOU FOREVER!!!  I mean it.  Forevah!
* jastey: for everything you've done and continue to do. :)
* The folks at The Gibberlings Three forums: for never failing to answer my many many questions

------------------------------------------------------------------------
USED TOOLS AND RESSOURCES
------------------------------------------------------------------------
The Framed mod was created using the resources provided by the IESDP (https://gibberlings3.github.io/iesdp/index.htm) and with the following software:

* Near Infinity				https://github.com/Argent77/NearInfinity/releases/latest
* WeiDU						http://www.weidu.org
* Audacity					https://www.audacityteam.org
* Real-Time-Voice-Cloning	https://github.com/CorentinJ/Real-Time-Voice-Cloning

Modding communities, tutorials and technical assistance:

The Gibberlings Three	http://gibberlings3.net

------------------------------------------------------------------------
HISTORY
------------------------------------------------------------------------
v1.0 - initial releases
v1.1 - brought CRE DV changes up to standard
v1.1.1 - just corrects comments and the forum and download links inside the ini file. No code changes.
v1.1.2 - updated this readme
v1.2 - corrections to the Keeper of the Portal's and Arkansis placement as well as a journal correction with cross-mod content (Camryn and Tamah)
v1.3 - moved Tamoko to outside of Iron Throne bldg for alternate ch6, FF can no longer follow out of IT HQ, fixed Eltan dialogue leading to altCh6, matched journal entries to existing ones, new chapter starts now make appropriate save games
v1.4 - improved chapter saves so reloads are smoother
v1.5 - updated this readme to include credit to Audacity for making the sound files, skipped the quest entry for going to Gorion's room, closed out the Investigating the Iron Throne quest in the journal when documents found, removed Tamoko changes, allowed FF to once again follow out of IT HQ, put in alternate diaries properly (leaving in original if normal ch 6 is done), smoothed out chapter transitions
v1.5.1 - updated this readme to include the changes in v1.5 in history
v1.6 - new versions of the chapter text narrations built using Real-Time-Voice-Cloning and Audacity
v1.7 - Tethtoril will hand the PC Gorion's scroll when they finish clearing out the catacombs when BG1NPC is installed to be more compatible with it
v1.8 - added cross mod compatibility with Transitions and Sarevok's diary for Cythandria's clean-up quest
v1.8.1 - added LableType in ini for installing with Project Infinity (https://forums.beamdog.com/discussion/74335/project-infinity-mod-manager-for-baldurs-gate-icewind-dale-planescape-torment-and-eet)
v1.9 - added check for Gatewarden in quest wrap dialogue with Tethtoril
v1.9.1 - updated ini file to point at new download location
v1.10 - fixed incompatibility with Unfinished Business mod and placed Scar's giving of work order at the end of his dialogue at the bridge
v1.11 - tightened up the dialogues in the underground caverns 
v1.12 - French translation by JohnBob

------------------------------------------------------------------------
LEGAL INFORMATION
------------------------------------------------------------------------
Framed is unofficial Fan Content permitted under the Fan Content Policy. Not approved/endorsed by Wizards. Portions of the materials used are property of Wizards of the Coast. ©Wizards of the Coast LLC.
This mod is also not developed, supported, or endorsed by BioWare, Black Isle Studios, Interplay Entertainment Corp., Overhaul Games or Beamdog. All other trademarks and copyrights are property of their respective owners.

