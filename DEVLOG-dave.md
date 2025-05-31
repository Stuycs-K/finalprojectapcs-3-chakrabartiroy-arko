# Dev Log:

This document must be updated daily every time you finish a work session.

## Arko Chakrabartiroy

### 2025-05-21 - Wrote Proposal
Wrote full project proposal with 3 proposed projects, including a platformer game, monopoly, and stabfish

### 2025-05-22 - Added backbone of prototype page
Added and formatted list of requirements (regarding what to write in PROTOTYPE.md) from teacher's website 

### 2025-05-23 - Added critical & nice to have features to PROTOTYPE.md
Spent _**way**_ too long doing Google searches on how to color text in github markdown. Eventually gave up and used LaTeX to write my name and period in blue. Added a reasonable number of critical features. Also added a very exhaustive list of nice to have features that I can already tell will make my life difficult in the near future.

### 2025-05-24 - Added a brief summary of the project
Wrote brief summary section of project (~1 paragraph). I can confirm that I did indeed brutally murder my home laptop's shift keys during this process. Good riddance. I also added/formatted some section titles to be headings (i.e. larger sizes)

### 2025-05-25 - Completed PROTOTYPE.md (including UML diagrams)
Finally stopped procrastinating on my prototype. Made a UML diagram and added it to the repository. Added the "technical details" section and a timeline that probably should have factored in my immense talent at procrastinating literally everything. Linked UML diagram to PROTOTYPE.md. Came up with a very cringe group name.

### 2025-05-27 - Actually started CODING!
Created three files, Player.pde, Game.pde, and Thing.pde. Somehow managed to import a player image (taken from griffpatch's generic red project on scratch) and have it drawn on the screen.

### 2025-05-28 - Begun work on touching function
**In class:** Begun working on a boolean touching() function in Thing.pde to determine if two Things are touching (e.g. if Player is touching a Platform).   
**At home:** Finally decided to log my changes on the devlog (all changes prior to this date were written by me today). 

### 2025-05-29 - Finished working on (basic) touching function
Finished writing a very basic touching function to return true if two rectangular objects are touching. If I have non-rectangular objects, such as spikes, I'll deal with those later.

### 2025-05-30 - Cleaned up joystick sprite in scratch remix of gen. red, added a joystick class in processing code
Realized that griffpatch's generic red code for simply moving left/right is extremely overcomplicated because of the recording features, joystick, high scores, etc etc etc so I combed through the joystick sprite code on scratch and deleted most of it (about 2% of the original code there remains now) so I can actually understand it (kind of). Added a simple joystick class/file to my processing code, but I haven't implemented the changes for moving left and right because the player sprite's scripts for those are a huge mess too and that mess is less easy to delete stuff from because a lot of it is actually necessary. Also, it looks like I will need to use at least one platform for reference for moving left/right and gravity, so I'm going to have to add the platformer class and initialize one platformer when I resume working on this.

### 2025-05-31 - Added Platform class and constructor; added several functions in Player.pde for platform interaction and moving/gravity
Finally added a platform class, along with a platform constructor and draw function. Added some player variables, including a list of platform objects in order to check collisions/touching. Wrote boolean touchingPlatforms(), changeY(), position(), touchPlatformOut() functions in Player.pde. Added a platform image and initialized it to test, everything seems to be working fine so far.
