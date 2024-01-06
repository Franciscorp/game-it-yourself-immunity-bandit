# Game It Yourself: Learn About HIV and Coding 

## Project Description
This project is being developed in the context of a research internship in the field of Communication Sciences, Informatics, and Computing, as part of the R&D project PLAYMUTATION2: Virus Epidemiologic-themed Digital Games and Youngsters' Attitudes to Viral Infections from DigiMedia.

This repository will contain the source code of a simple platformer game with an HIV theme, from which there will be two versions. The first one is the complete, working version of the game, whereas the second will be deconstructed to serve as an educational tool to introduce foundational coding and game development principles to high school students.


## Concrete Goals 
- Learn the basics of programming (if-else, for-cycle, counters);
- Learn the basics of game development (sprites, sound design, head-up display (HUD));
- Learn the basics of object-oriented programming (classes, objects, instances, methods, variables, properties, don't repeat yourself principle);
- Learn about HIV (effects and prevention) and how it spreads, and AIDS. Emphasis on avoiding misinformation surrounding the virus and the disease;
- Learn the basics of how to work with the Godot game engine.


## Game 
In this computer platformer game, players will navigate the bloodstream, simulating the spreading of HIV in a body. The objective is to capture T-helper cells, also known as CD4 cells, in order to replicate the virus, while evading the immune system's response.

Inspired by games such as [Doodle Jump](https://doodle-jump.fandom.com/wiki/Doodle_Jump_Wiki) and [Pou's Sky Jump](https://pou.fandom.com/wiki/Sky_Jump), the gameplay consists of navigating through different body areas (levels) by leaping across diverse platforms, trying not to fall and spread the virus as far as possible (reach the end). The player must capture T-helper cells to replicate itself, and therefore the virus. Concurrently, the player must avoid enemies and adversities, such as white blood cells (the body's defence system), antiretroviral pills that combat the HIV virus and moving or disappearing platforms. The speed at which the platforms move will increase progressively, intensifying the challenge as players ascend higher.

Upon reaching specific score milestones, players will earn achievements that unlock informative health facts about HIV and AIDS. This aims to disprove misinformation and foster understanding about the virus and the associated illness.

The selection of this game type was driven by its straightforward gameplay and mechanics, enabling students to concentrate on intricacies such as player movement, jump gravity, HUD updates, asset alterations triggered by specific events, achievements with health facts, and more.

### Tutorial 
Embedded within the game, the tutorial serves as the opening level, designed to facilitate the player's grasp of the fundamental gameplay mechanic – namely, platform jumping and capturing T-helper cells. 

### HIV Detected
Following the tutorial, the player is informed that the presence of HIV (themselves) has been detected within the system. This triggers the activation of defence mechanisms, including moving or disappearing platforms (blood cells and platelets) and medication, all of which contribute to heightened challenges for the player.


## Elements To Be Developed
- HUD
  - Score (number of platforms jumped on);
  - Number of HIV replicas (number of captured T helper cells);
  - Pup-up achievements (based on the number of replicas). 
 
- Gameplay
  - Automatic jump (the player does not have to press or trigger any key to initiate this movement);
  - Movement in the x-axis (left-right) by mouse input (moving the pointer in such direction), A-D keys or < > keys (**TO BE DETERMINED**: give the option to rebind);
  - Simple platforms;
  - Moving platforms;
  - Disappearing platforms (they fade after the player jumps on them);
  - Capture T helper cells (the HIV replicates itself and fades out of the screen);
  - Falling pills and white blood cells that collide with the player (**TO BE DETERMINED**: the effect this has on the gameplay);
  - Progressively increase the speed at which the platforms traverse the screen vertically;
  - Wrap-around screen (by moving off of one side of the screen, the player reappears on the opposite side);
  - Show educational health information about HIV and AIDS at the end of each run based on the achievements earned.

- Menu
  - Sound volume;
  - Mouse sensitivity;
  - Key remapping;
  - Difficulty control (**TO BE DETERMINED**: what exactly can be enabled/disabled in order to control the level of difficulty).
