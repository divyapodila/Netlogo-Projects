## CMPS 5443 SOFTWARE AGENTS FALL SEMESTER 2023

## NETLOGO PROJECT 5 - "Dartopia: Where Darts and Targets Collide" Extention to P04

## WHAT IS IT?

This NetLogo model simulates a game where humans with guns try to hit targets using darts. The game involves the creation of humans equipped with guns and darts at the center of the simulation. Targets appear at random positions on circular paths, and the objective is for the humans to throw darts to hit these targets. The simulation keeps track of the score, the number of targets hit, and the highest score achieved. The game runs for a set number of ticks (2000 ticks in this case), saves the highest score to a file and display game over user message at the end..

## HOW IT WORKS

Initialization (new-game): The model starts by clearing the environment, setting up parameters, and creating a central human with a gun and a dart.

Target Creation (create-new-target): Periodically, new targets are created at random positions on a circular path around the central point.

Update Targets (update-targets): Existing targets age over time, and if they reach their lifespan, they are removed. New targets are created periodically.

Throwing Darts (throw): The user can initiate dart throws, and each human agent produces a dart in the direction it is facing.

Dart Movement (go-darts): Darts move forward, and if they hit the boundary, they are removed. Collisions with targets are checked.

Target-Dart Collision (check-dart-target-collision): If a dart collides with a target, the target is marked for removal, a beep sound is played, and the player's score is updated as per pcolor if the target that was hit is in blue it adds 5, for pink 10 and yellow 20 points.

Checking Targets for Removal (check-targets-die): Targets marked for removal are removed, and a new target is created.

Scoring and Highest Score (go): The model tracks the score, updates the highest score, and stops after a set number of ticks.

## HOW TO USE IT

Press the "New Game" button to initialize the environment and start the game.

Click the "Throw Darts" button to enable the human agents to throw darts.

Observe the movement of darts and their collisions with targets.

The score and highest score are displayed in the interface.

Experiment with adjusting parameters like target creation rate and dart speed.

## THINGS TO NOTICE

Target Creation: Pay attention to how new targets are created periodically.

Dart Throwing: Observe the behavior of humans throwing darts and hitting targets.

Score Changes: Monitor the score and highest score as the simulation progresses.

## THINGS TO TRY

Adjust Parameters: Experiment with changing parameters such as target creation rate, dart speed, or the initial radius.

Observe Score Changes: Watch how the score changes according the hit targets in different color patches.

Highest Score Tracking: Note how the highest score is tracked and updated.

## EXTENDING THE MODEL

Extension - 1

***Aim Angle***

Set an Aim Angle of the Dart to hit the targets appearing in different patches.

Extension - 2

***Disappearing Targets***

Targets appear one after the other throughout the simulation in different random locations of the patches. They disappear after certain ticks.
The Player needs to set aim angle quickly and throw the dart before the Target disappers.




## NETLOGO FEATURES

Breeds: The model uses NetLogo's breed feature to define different types of agents, such as humans, guns, targets, and darts. This helps organize and differentiate the various entities in the simulation.

Patch Colors: Different colors are assigned to patches based on their distance from the center. This is achieved using the ask patches construct along with conditional statements to set patch colors based on distance.

Link Creation: Links are used to represent ties between guns and their aiming arrows. The create-link-to command is employed to create directed ties between the guns and their associated darts.

File I/O: The model reads and writes data to a file. It checks if a file ("highscore.txt") exists, reads the highest score from the file, and saves the highest score back to the file at the end of the simulation.

Tick-based Events: The game progresses in discrete time steps (ticks). Various actions, such as updating targets, moving darts, and checking collisions, are triggered based on the current tick count.

Global Variables: Global variables are used to keep track of important information across the entire simulation, such as the score, aiming angle, and highest score.

Hatching Agents: The hatch command is used to create new agents (darts) during the simulation. For example, each human hatches a dart when the throw procedure is invoked.

Conditional Statements: The model uses conditional statements (if, ifelse) to control the flow of the simulation based on certain conditions, such as whether it's time to create a new target or whether a dart has reached the boundary and also used for scoring if the target that was hit is in blue it adds 5, for pink 10 and yellow 20 points.

Beep Sound: The beep command is used to play a sound when a dart hits a target.

## CREDITS AND REFERENCES

Professor - Dr. Tina Jhonson

https://ccl.northwestern.edu/netlogo/docs/

https://netlogoweb.org/whats-new#may24th2019-v2.6.0

https://groups.google.com/g/netlogo-users/c/WIgqu5qlMcg

https://chat.openai.com/
