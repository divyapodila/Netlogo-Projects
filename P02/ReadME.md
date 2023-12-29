## What is IT & HOW IT WORKS

**This model represents 10-100 agents moving about randomly in a world with various Temperatures.**

( It has Four regions displayed as a color representation of Heat : Red,Orange,Yellow   and Green (Hottest to Coldest).

 User Selects between 2 different Layouts "Quadrant" and " Vertical".
 
 Quadrant divides the world into 4 x-y planes,

 Vertical divides the world into 4 equally spaced color patches Red,Orange,Yellow and 

 Green with a divider in Black to differentiate between patches.

 If the agent is in a warmer region, movement is High . example: Red is hottest
 region, so move FD by 4

 Green is the coldest region, move forward by 0.2

 If the "Track-turtle" Switch is ON, turtle is tracked.)

## HOW TO USE IT

(On the Interface Tab, the following Components are visible:

1. **Setup Button**: Click this button to initialize and set up the model environment, creating turtles and defining their initial conditions.

2. **Go Button**: Click this button to start the simulation, allowing turtles to move and interact based on the model's rules.

3. **Number of Turtles Slider**: Adjust this slider to control the quantity of turtles created in the model.

4. **Layout Selector**: Choose between "Quadrant" and "Vertical" layouts to determine how the model's environment is structured.

5. **Track Turtle? Switch**: Toggle this switch on to enable turtle tracking. When on, a specific turtle will be tracked and have its pen down.


These interface elements are specifically to control turtle behavior, tracking, and drawing in the simulated environment. )

## THINGS TO NOTICE


(While the model is running, observe the following aspects in the world to better understand its behavior:

1. **Turtle Movements**: Watch how individual turtles move around the world. They will follow specific patterns based on the environmental layout and their assigned colors (red, orange, yellow, or green).

2. **Drawing**: If the "Track Turtle?" switch is on and a turtle is actively being tracked, pay attention to the drawing pattern it creates. It will leave a trail on patches as it moves, which can help you understand its path.

3. **Button Interactions**: Keep an eye on the "Setup" and "Go" buttons. "Setup" initializes the model, while "Go" starts or continues the simulation. Clicking these buttons can control the simulation's progress.

4. **Slider Adjustment**: If you adjust the "Number of Turtles" slider, observe how it affects the number of turtles in the world. More turtles will create denser movement patterns.

5. **Layout Changes**: If you switch between "Quadrant" and "Vertical" layouts, notice how the turtles' movements with different patches change accordingly.)

## THINGS TO TRY

(Here are some things to try while running this model:

1. **Toggle Tracking**: Turn the "Track Turtle?" switch on and off to see how it affects the behavior of the tracked turtle. When it's on, the turtle will leave a drawing trail; when it's off, the turtle won't draw.

2. **Adjust Turtle Count**: Use the "Number of Turtles" slider to change the number of turtles in the world. More turtles can lead to denser and more complex movement patterns.

3. **Change Layout**: Switch between the "Quadrant" and "Vertical" layouts to observe how turtles interact differently with the environment based on the layout.

4. **Modify Turtle Movements**: Experiment with different turtle movement patterns. You can change the values in the `go` procedure to make turtles move faster or slower and in different directions.

5. **Select a Different Tracked Turtle**: Change the tracked turtle by setting a different turtle number using the "Tracked Turtle" slider. Observe how the new turtle behaves when tracking is enabled.)


## CREDITS AND REFERENCES

(1.**Many Regions Example** from the Netlogo Models Library Example codes

 2.**Stack overflow Website** to get an idea on how to divide the regions based on x-y coordinates.
 **LINK** : https://stackoverflow.com/questions/69509024/netlogo-divide-world-into-upper-and-lower
3. **Chat-GPT**)
