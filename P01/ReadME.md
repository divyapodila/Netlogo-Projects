## New Features

(Feature-1:

 Clear Turtles Button:

 Added a button labeled "Clear Turtles" to the interface, which, when clicked,clears all the turtles from the simulation.

 Feature-2:

 Energy Plot ("Add-Turtle-energies"):

 Added a feature that calculates the sum of all the energies of the turtles at a single tick and displays this data in a graph. As the turtles die,the number of turtles in the simulation decreases, and correspondingly, the graph representing their energy levels also decreases.)

## WHAT IS IT?

(The model represents a simulation where turtles (agents) move around, consuming gray patches as food to increase their energy. Turtles reproduce if they have enough energy, and the simulation tracks their survival and the regrowth of grass patches.)

## HOW IT WORKS

(The agents in the model follow these rules to create the overall behavior:

1. **Eating Behavior:** Agents (turtles) eat gray patches by changing them to black, gaining energy in the process.

2. **Movement:** Turtles move randomly, changing their direction and decreasing energy.

3. **Reproduction:** Turtles reproduce when their energy exceeds a certain threshold, creating new turtles with initial energy.

4. **Survival:** Turtles die if their energy becomes negative.

5. **Grass Regrowth:** Gray patches randomly regrow over time, providing a renewable food source for turtles.)
