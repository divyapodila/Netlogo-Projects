## CMPS 5443 SOFTWARE AGENTS FALL SEMESTER 2023

## NETLOGO PROJECT 4 - "Dartopia: Where Darts and Targets Collide"

## WHAT IS IT?

The model is a simulation of an archery game where the player must shoot darts at moving targets to earn points. The player controls a character that shoots darts at targets that are continuously moving up and down the screen. The game aims to test the player's aiming and shooting skills by hitting as many targets as possible with limited darts.

## HOW IT WORKS

Agents: The model involves three breeds of agents: humans (archers), darts, and targets.

Initialization: The setup procedure initializes the simulation by creating patches, humans, darts, and targets.

Gameplay: The player can shoot darts by clicking the "Shoot" button. Darts are launched from the character and move horizontally across the screen.

Target Movement: Targets move vertically within specific regions based on their x-coordinates, imitating different levels of difficulty.

Scoring: When a dart hits a target, the player's score increases, and the hit targets are removed from the simulation.

Win/Lose Conditions: The player wins when all targets are hit, and the game ends when the player runs out of darts without hitting all targets.

## HOW TO USE IT

Setup: Press the "Setup" button to initialize the simulation.

Shoot: Click the "Shoot" button to launch an arrow from the character. You have a limited number of shots (10 by default).

Game Progress: Watch the targets move and aim to hit as many as possible to increase your score.

Win/Lose: The game ends when you hit all targets (win) or when you run out of arrows without hitting all targets (lose).


## THINGS TO NOTICE

Observe how the targets move at different speeds depending on their horizontal positions.

Keep an eye on your remaining shots; the game will end when you run out.

Notice how the player's score increases with each hit target.

Pay attention to the message area for game status updates.

## THINGS TO TRY

Try to hit all the targets to win the game.

Experiment with different strategies for aiming and shooting.

Modify the code to adjust the number of remaining shots, target movement speeds, or other game parameters.

## EXTENDING THE MODEL

Player-Controlled Dart Angle: Added the ability for the player to control the angle at which the dart is launched.

Dart Direction Control: Implemented controls (e.g., slider or buttons) for the player to set the dart's direction, allowing them to aim at targets on both the left and right sides of the screen.

Launch Dart at an Angle: Modified the shoot procedure to take into account both the dart's direction and the angle set by the player when launching a dart.

Control the Dart Angle: Introduced a control mechanism (e.g., slider or buttons) for the player to adjust the dart's angle dynamically during gameplay.

Update Dart Angle: Adjusted the go-darts procedure to consider the player-controlled dart angle, allowing for dynamic changes in the dart's trajectory.

## NETLOGO FEATURES

The model uses NetLogo's agent-based modeling features to create and control agents, such as ask, sprout, and hatch.

It utilizes patches and breeds to set up the game environment and agent interactions.

The update-user-message procedure updates the user message in the Interface tab.


## CREDITS AND REFERENCES

https://ccl.northwestern.edu/netlogo/docs/

https://cs4all.cs.unm.edu/Modules/CheatSheet/Module%201%20Code%20Cheat%20Sheet.pdf

https://chat.openai.com
