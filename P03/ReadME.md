## WHAT IS IT?

(The model simulates a population of agents with varying colors and influence levels. These agents interact with their neighbors, and their colors change based on the average color of nearby neighbors, weighted by their individual influence levels. The goal is to demonstrate how agents influence each other's colors within a defined vision radius.)

## HOW IT WORKS

(The model works as below:

**Setup**: It starts by creating a population of turtles with random positions, colors, and influence levels. The influence level is determined by the turtle's color.

**Go**: In each iteration, turtles move a short distance, find their neighbors within a defined vision radius, and determine their influence on the turtle's color.

**Find Neighbors**: Turtles identify their neighbors within their vision radius and count them. Turtle 4 can optionally draw its vision and display the count of its neighbors.

**Change Color**: Turtles adjust their colors based on the average color of their neighbors, weighted by their influence levels. The new color is calculated as a blend between the turtle's current color and the average neighbor color, considering the turtle's influence.

This process repeats over multiple time steps, allowing for the observation of how agents influence each other's colors based on their positions, colors, and influence levels.)

## HOW TO USE IT

(To use this model, follow these steps:

1. **Setup**:
   - Click the "Setup" button to initialize the model. This creates a population of agents (turtles) based on the settings in the Interface tab.
   - Adjust the "Initial Number of Agents" slider to set the desired number of agents in the simulation.

2. **Go**:
   - Click the "Go" button to start the simulation.
   - The agents will move in small steps, and their colors will change based on their neighbors' influence.

3. **Interface Tab**:
   - **Initial Number of Agents**: Adjust the slider to set the initial number of agents.
   - **Vision**: Set the radius of vision for each agent, which determines the range within which they can influence and be influenced by neighbors.
   - **Track Turtle 4**: Toggle this switch to enable Turtle 4 to draw its vision and display the count of neighbors it interacts with.
   - **N/Average Colors**: Monitor that displays the average color of all agents.
   - **Neighbors in Vision Count**: Monitor that shows the number of neighbors Turtle 4 interacts with (if the "Track Turtle 4" switch is on).)

## THINGS TO NOTICE

(While running the model, here are some things for the user to notice and observe:

1. **Color Convergence**: Pay attention to whether the agents' colors tend to converge over time. Do agents with similar colors influence each other more?

2. **Influence Levels**: Observe how agents with different influence levels (based on their colors) affect their neighbors' colors. Do agents with higher influence levels have a more significant impact on their neighbors?

3. **Effect of Vision Radius**: Experiment with different values for the "Vision" slider. Notice how changing the vision radius affects the number of neighbors each agent interacts with and the overall dynamics of color change.

4. **Turtle 4 Interaction**: If "Track Turtle 4" is enabled, watch how Turtle 4 interacts with its neighbors. Notice how the number of neighbors it interacts with changes over time.

5. **Color Variation**: Pay attention to the overall color variation in the population. Do the agents' colors become more homogeneous or maintain diversity?

6. **Smooth Movement**: The "Go" procedure includes a small forward movement for each agent. Observe how this contributes to smoother transitions in agent movement.)


## CREDITS AND REFERENCES
(Did not refer to any resources online)
