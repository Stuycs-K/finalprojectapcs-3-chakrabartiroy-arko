# Dev Log:

This document must be updated daily every time you finish a work session.

## Arko Chakrabartiroy

### 2025-05-21 - Wrote Proposal

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-21---wrote-proposal)

Wrote full project proposal with 3 proposed projects, including a platformer game, monopoly, and stabfish

### 2025-05-22 - Added backbone of prototype page

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-22---added-backbone-of-prototype-page)

Added and formatted list of requirements (regarding what to write in PROTOTYPE.md) from teacher's website

### 2025-05-23 - Added critical & nice to have features to PROTOTYPE.md

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-23---added-critical--nice-to-have-features-to-prototypemd)

Spent _**way**_ too long doing Google searches on how to color text in github markdown. Eventually gave up and used LaTeX to write my name and period in blue. Added a reasonable number of critical features. Also added a very exhaustive list of nice to have features that I can already tell will make my life difficult in the near future.

### 2025-05-24 - Added a brief summary of the project

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-24---added-a-brief-summary-of-the-project)

Wrote brief summary section of project (~1 paragraph). I can confirm that I did indeed brutally murder my home laptop's shift keys during this process. Good riddance. I also added/formatted some section titles to be headings (i.e. larger sizes)

### 2025-05-25 - Completed PROTOTYPE.md (including UML diagrams)

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-25---completed-prototypemd-including-uml-diagrams)

Finally stopped procrastinating on my prototype. Made a UML diagram and added it to the repository. Added the "technical details" section and a timeline that probably should have factored in my immense talent at procrastinating literally everything. Linked UML diagram to PROTOTYPE.md. Came up with a very cringe group name.

### 2025-05-27 - Actually started CODING!

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-27---actually-started-coding)

Created three files, Player.pde, Game.pde, and Thing.pde. Somehow managed to import a player image (taken from griffpatch's generic red project on scratch) and have it drawn on the screen.

### 2025-05-28 - Begun work on touching function

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-28---begun-work-on-touching-function)

**In class:** Begun working on a boolean touching() function in Thing.pde to determine if two Things are touching (e.g. if Player is touching a Platform).  
**At home:** Finally decided to log my changes on the devlog (all changes prior to this date were written by me today).

### 2025-05-29 - Finished working on (basic) touching function

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-29---finished-working-on-basic-touching-function)

Finished writing a very basic touching function to return true if two rectangular objects are touching. If I have non-rectangular objects, such as spikes, I'll deal with those later.

### 2025-05-30 - Cleaned up joystick sprite in scratch remix of gen. red, added a joystick class in processing code

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-30---cleaned-up-joystick-sprite-in-scratch-remix-of-gen-red-added-a-joystick-class-in-processing-code)

Realized that griffpatch's generic red code for simply moving left/right is extremely overcomplicated because of the recording features, joystick, high scores, etc etc etc so I combed through the joystick sprite code on scratch and deleted most of it (about 2% of the original code there remains now) so I can actually understand it (kind of). Added a simple joystick class/file to my processing code, but I haven't implemented the changes for moving left and right because the player sprite's scripts for those are a huge mess too and that mess is less easy to delete stuff from because a lot of it is actually necessary. Also, it looks like I will need to use at least one platform for reference for moving left/right and gravity, so I'm going to have to add the platformer class and initialize one platformer when I resume working on this.

### 2025-05-31 - Added Platform class and constructor; added several functions in Player.pde for platform interaction and moving/gravity

[](https://github.com/Stuycs-K/finalprojectapcs-3-chakrabartiroy-arko/blob/main/DEVLOG-dave.md#2025-05-31---added-platform-class-and-constructor-added-several-functions-in-playerpde-for-platform-interaction-and-movinggravity)

Finally added a platform class, along with a platform constructor and draw function. Added some player variables, including a list of platform objects in order to check collisions/touching. Wrote boolean touchingPlatforms(), changeY(), position(), touchPlatformOut() functions in Player.pde. Added a platform image and initialized it to test, everything seems to be working fine so far.  
Also added the (very large) player Tick() function. Almost finished with moving/gravity mechanics hopefully.

### 2025-06-01 – Added simultaneous key handling and experimenting with camera scrolling.

Added support for **multiple simultaneous keypresses** by introducing a boolean `keys[]` array in _Player_ and writing functions `keyPressed` and `keyReleased` in _Game.pde_. 

Implemented a developer `**center()**` rese function that instantly re‑centers the player and world for quick debugging. 

Starting to work on **camera scrolling**.  Wrote `scrollX` and `scrollY` variables for Player in _Player.pde_, passed them to every Platform and Spike, and verified the world pans smoothly as the player runs (it's a bit jittery but it's functional).

### 2025-06-02 – Cleaning up code and continue to work on gravity and camera scroll

Cleaned things up by removing the leftover Scratch code from the project and making all the tick method signatures more comparable. 

Made some changes to the acceleration and gravity of player movements.
Added overriding declarations for tick() in Player and Platform to continue implementing **camera scrolling**

### 2025-06-03 – Gravity works! Added Smoother Move & Jump

GRAVITY WORKS!!! 

Continued working on implementing smooth left and right movement. Successfully added  a functional jump mechanic.

### 2025-06-04 –  Scrolling Works and Cleaning up multiple key presses

Finished the algorithms of a robust camera scrolling motion so that platforms look like they remain in the same place: the player stays centered while the world scrolls. 

Realized the possibility of having multiple keys being pressed confusing the user input, and cleaned up code to handle multi‑keypresses

I tweaked platform sprite layout for alignment.

### 2025-06-06 – Finished Dev `center()` Reset and Added Overlap Helpers

Fixed the developer `center()` reset so every object snaps back correctly when the player dies. I realized that there needs to be multiple layers of graphics, so I drafted an `xOverlap()` utility that's still experimental. I need to implement this further so it can resolve horizontal collisions.

### 2025-06-07 – Constructed Collision for Player and Objects on the Map
Re‑worked edge‑case checks so the player can no longer clip into or through platforms when jumping or running into edges.

### 2025-06-09 – Bug Fix
Squashed several minor bugs related to 
- inertia when player is moving
- jump cancellation
- the order of sprites getting drawn on map
Now the code is ready for implementing dangers and enemies.

### 2025-06-10 – Cleaned up _Spike.pde_ and started Prototyping Player Death 
Attempted to add a floating‑island platform that's not yet functional. I realized that Processing does not allow for not square png files to be added.

I renamed **Spike.pde** so that it contains the spike obstacles and I made Spike mirror Platform's `tick` and `reset` functions. I then started make an attempt on adding first player‑death‑on‑spike which still needs a lot of debugging, and I cleaned up some comments

### 2025-06-12 – Portal, Coins, and Final Polish
Reworked the `Danger` superclass so that spike collision now reliably triggers a functional player death with “You Died!” text.
    
Implemented **Portal** that inherits _Platform.pde_ and placed it at the level end. I made it disabled until all coins are collected. The portal uses same logic of camera scroll as platform.
    
Added **Coin.pde** to contain coin objects.  The coin objects can be spawned at setup and scroll with the world. Player collision with coin hides coins and updates the counter text on the top left to display how many coins are left to be collected: live “Coins X / Y” counter in top‑left of screen.
    
- Finished scaffolding Level 2 for future expansion.
