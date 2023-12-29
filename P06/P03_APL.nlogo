breed [containers container]
breed [falling-objects falling-object]
globals [score game-over-timer new-score container-speed power-up-duration power-up-taken action]
turtles-own [random-speed]
breed [power-ups power-up]
power-ups-own [duration]
extensions [sound]


to setup
  set action 0
  clear-all
  create-containers 1 [
    setxy 0 min-pycor + 1
    set shape "container"
    set size 2
    set color white
    set heading 90
  ]
  set score 0
  set num-objects num-objects
  let x-spacing (16 - (-16)) / (num-objects + 1)
  let initial-x -16 + x-spacing ; Set the initial x-coordinate

    create-falling-objects num-objects [                        ;; creating falling objects
    setxy (initial-x + (x-spacing * (who - 1))) 15              ;; initial coordinates setup
    set shape "dot"
    set color color
    set size 2
    set random-speed (random-float 0.3)
    set game-over-timer 1500                                   ;; set gameover timer
  ]
  create-power-ups no-of-power-ups [                            ;; create powerups
    setxy random-xcor (initial-x + 30)
    set shape "lightning"
    set color yellow
    set size 2
  ]
  set container-speed 1                                       ;; create container to catch the objects
  reset-ticks
end


to go
  move-objects
  move-container
  move-power-ups
  check-catch
  update-power-up-duration
  set game-over-timer game-over-timer - 1                     ;; decrement gamover timer by 1 at each tick
  if game-over-timer = 0 [
    user-message "Game Over!!!"                               ;; display a Game over message when timer = 0
    stop
  ]
  tick
end


to move-objects
  ask falling-objects [
    let my-patch patch-here
    if (pxcor >= min-pxcor and pxcor <= max-pxcor) [             ;; set speed for moving objects
      set ycor ycor - random-speed
    ]
  ]
end


to move-power-ups
  ask power-ups [
    let my-patch patch-here
    if (pxcor >= min-pxcor and pxcor <= max-pxcor) [              ;; set speed for moving power-ups
      set ycor ycor - 0.1
    ]
  ]
end


to check-catch
  ask containers [
    let catcher self
    let caught-power-up nobody
    let caught-objects []
    ask falling-objects [
      if distance catcher <= 1.2 [                                  ;; condition to check catch distance
        sound:play-drum "ACOUSTIC SNARE" 64
        set score score + 1                                         ;; keep track of score
        set new-score score
        wait 1
        die
      ]
    ]
    ask power-ups [
      if distance catcher <= 1.2 [                                                  ;; condition to check catch distance for powerups
        set new-score score
        wait 1
        set container-speed (container-speed + 3)
        set power-up-duration 300                                                 ;; Set the duration of the power-up effect
        set power-up-taken true
        die
      ]
    ]
  ]
end


to update-power-up-duration
  ask power-ups [                                                                                       ;; decrement powerup timer by 1
    if power-up-taken = true [
      set power-up-duration power-up-duration - 1
       if power-up-duration = 0 [
      user-message "Power up duration Over!!"                                                           ;; display a user message once timer = 0
      set power-up-taken  false
      set container-speed 1                                                                             ;; Reset fire speed to normal when power-up duration and delay are over
  ]
  ]
  ]
end


to move-container                                                                                     ;; arrow keys "D" for moving right and "D " for moving left
if (action != 0)
    [ if (action = 1)
        [ move-left ]
      if (action = 2)
        [ move-right ]
        set action 0
  ]
end


to move-left
  ask containers  [
 fd  (0 - container-speed)

  ]
end


to move-right
  ask containers [
   fd ( container-speed )

  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
799
600
-1
-1
17.61
1
10
1
1
1
0
1
1
1
-16
16
-16
16
1
1
1
ticks
30.0

BUTTON
17
115
80
148
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
100
116
163
149
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
6
226
92
259
move-left
set action 1
NIL
1
T
OBSERVER
NIL
A
NIL
NIL
1

BUTTON
105
225
194
258
move-right
set action 2
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

MONITOR
823
48
894
93
NIL
new-score
17
1
11

MONITOR
817
128
944
181
GAME_ENDS_IN:
game-over-timer
0
1
13

SLIDER
11
31
183
64
num-objects
num-objects
10
30
24.0
1
1
NIL
HORIZONTAL

PLOT
816
224
1016
374
SCORE
NIL
NIL
0.0
10.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -5825686 true "" "plot new-score"

SLIDER
11
315
183
348
no-of-power-ups
no-of-power-ups
0
5
3.0
1
1
NIL
HORIZONTAL

TEXTBOX
807
491
971
593
Team Members:\n1. Divya Podila\n2. Madhuri Kuruguntla\n3. Hari Krishna Mundra
14
0.0
1

TEXTBOX
1096
35
1371
415
How to Play:\n\n1. Click on Setup and GO\n2. Use Keys \"A\" and \"D\" for Left and right movement of the Container.\n3. Small colored dots will descend from the top of the screen.\n4. The player's task is to catch these falling objects using the container.\n5. Each time a falling object is caught by the container, the player earns one point.\n6.Catching a power-up will temporarily increase the speed of the container fire.\nThe duration of the power-up is limited, and a message will indicate when the power-up duration is over.\n7. The game has a timer, and if it reaches zero, the game is over.
15
0.0
1

TEXTBOX
811
10
961
35
APL P03\n
20
0.0
1

@#$#@#$#@
## WHAT IS IT?

(The Falling Objects Game is a simple simulation where a player-controlled container fire catches falling objects using arrow keys. Each catch earns points, and power-ups temporarily boost the container's speed. The game ends when a timer reaches zero, displaying a "Game Over!!!" message.

**APL P03**

Team Members:

1. Divya Podila
2. Madhuri Kuruguntla
3. Hari Krishna Mundra)

## HOW IT WORKS

(The Falling Objects Game works based on the following rules:

**Setup**:

Initialize a container fire at the top of the screen and falling objects with random speeds.
Create power-ups with a chance of appearing.

**Game Loop (Go)**:
Move falling objects downward, simulating their descent.
Allow player-controlled container to move left or right.
Check for collisions between the container and falling objects or power-ups.

**Scoring**:
Score points when the container catches falling objects.
Update the score display.

**Power-Ups**:
Increase the container's speed temporarily upon catching a power-up.
Display a message when the power-up duration is over.

**Game Over**:
Countdown a timer, and if it reaches zero, end the game.
Display a "Game Over!!!" message.

**User Input (Move-Container)**:
Respond to left and right arrow key inputs to move the container fire.)

## HOW TO USE IT

(To use the Falling Objects Game model, follow these instructions:

**Interface:**
1. **Setup Button:**
   - Click the "Setup" button to initialize the game with the default settings.

2. **Go Button:**
   - Click the "Go" button to start the game loop and allow falling objects to descend.

3. **Arrow Keys:**
   - Use the left and right arrow keys to move the container fire left and right, respectively.

4. **Score Display:**
   - Monitor the "Score" display to track your points as you catch falling objects.

5. **Timer Display:**
   - Watch the "Timer" display to know how much time is remaining before the game ends.

6. **Game Over Message:**
   - If the timer reaches zero, a "Game Over!!!" message will be displayed.

**Gameplay:**
- Catch falling objects by moving the container left and right.
- Earn points for each caught object.
- Catch power-ups to temporarily increase the container's speed.
- Be strategic with power-ups and aim for the highest score before the timer runs out.

**Note:**
- Adjust the code parameters (e.g., number of falling objects, speed) in the NetLogo Code tab for different gameplay experiences.
- Experiment with setup options and observe how changes impact the game dynamics.)

## THINGS TO NOTICE

(While running the Falling Objects Game model, pay attention to the following aspects to better understand the simulation:

1. **Scoring Dynamics:**
   - Observe how the score increases each time the container fire catches a falling object.
   - Take note of any variations in scoring when catching power-ups.

2. **Power-Up Effects:**
   - Notice the temporary increase in the container fire's speed when a power-up is caught.
   - Monitor the duration of the power-up effect and its impact on gameplay.

3. **Collision Handling:**
   - Observe how the game responds to collisions between the container fire and falling objects or power-ups.
   - Check if the game appropriately registers catches and updates the score.

4. **Timer Impact:**
   - Pay attention to the timer countdown and observe how it affects the game's duration.
   - Note how the game concludes with a "Game Over!!!" message when the timer reaches zero.

5. **User Input Interaction:**
   - Experiment with using the left and right arrow keys to control the container fire.
   - Observe how responsive the container fire is to user input.

6. **Variable Adjustments:**
   - Explore changing parameters in the NetLogo Code tab (e.g., number of falling objects, speed) to observe how they affect gameplay.
   - Experiment with different setup options to see how they influence the overall dynamics of the game.

By focusing on these aspects, you can gain insights into the game mechanics and how various elements interact to create the gaming experience.)


## CREDITS AND REFERENCES

(- Chat GPT)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

butterfly 2
true
0
Polygon -16777216 true false 151 76 138 91 138 284 150 296 162 286 162 91
Polygon -7500403 true true 164 106 184 79 205 61 236 48 259 53 279 86 287 119 289 158 278 177 256 182 164 181
Polygon -7500403 true true 136 110 119 82 110 71 85 61 59 48 36 56 17 88 6 115 2 147 15 178 134 178
Polygon -7500403 true true 46 181 28 227 50 255 77 273 112 283 135 274 135 180
Polygon -7500403 true true 165 185 254 184 272 224 255 251 236 267 191 283 164 276
Line -7500403 true 167 47 159 82
Line -7500403 true 136 47 145 81
Circle -7500403 true true 165 45 8
Circle -7500403 true true 134 45 6
Circle -7500403 true true 133 44 7
Circle -7500403 true true 133 43 8

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

container
false
0
Rectangle -7500403 false false 0 75 300 225
Rectangle -7500403 true true 0 75 300 225
Line -16777216 false 0 210 300 210
Line -16777216 false 0 90 300 90
Line -16777216 false 150 90 150 210
Line -16777216 false 120 90 120 210
Line -16777216 false 90 90 90 210
Line -16777216 false 240 90 240 210
Line -16777216 false 270 90 270 210
Line -16777216 false 30 90 30 210
Line -16777216 false 60 90 60 210
Line -16777216 false 210 90 210 210
Line -16777216 false 180 90 180 210

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

crown
false
0
Rectangle -7500403 true true 45 165 255 240
Polygon -7500403 true true 45 165 30 60 90 165 90 60 132 166 150 60 169 166 210 60 210 165 270 60 255 165
Circle -16777216 true false 222 192 22
Circle -16777216 true false 56 192 22
Circle -16777216 true false 99 192 22
Circle -16777216 true false 180 192 22
Circle -16777216 true false 139 192 22

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

drop
false
0
Circle -7500403 true true 73 133 152
Polygon -7500403 true true 219 181 205 152 185 120 174 95 163 64 156 37 149 7 147 166
Polygon -7500403 true true 79 182 95 152 115 120 126 95 137 64 144 37 150 6 154 165

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fire
false
0
Polygon -7500403 true true 151 286 134 282 103 282 59 248 40 210 32 157 37 108 68 146 71 109 83 72 111 27 127 55 148 11 167 41 180 112 195 57 217 91 226 126 227 203 256 156 256 201 238 263 213 278 183 281
Polygon -955883 true false 126 284 91 251 85 212 91 168 103 132 118 153 125 181 135 141 151 96 185 161 195 203 193 253 164 286
Polygon -2674135 true false 155 284 172 268 172 243 162 224 148 201 130 233 131 260 135 282

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

ghost
false
0
Polygon -7500403 true true 30 165 13 164 -2 149 0 135 -2 119 0 105 15 75 30 75 58 104 43 119 43 134 58 134 73 134 88 104 73 44 78 14 103 -1 193 -1 223 29 208 89 208 119 238 134 253 119 240 105 238 89 240 75 255 60 270 60 283 74 300 90 298 104 298 119 300 135 285 135 285 150 268 164 238 179 208 164 208 194 238 209 253 224 268 239 268 269 238 299 178 299 148 284 103 269 58 284 43 299 58 269 103 254 148 254 193 254 163 239 118 209 88 179 73 179 58 164
Line -16777216 false 189 253 215 253
Circle -16777216 true false 102 30 30
Polygon -16777216 true false 165 105 135 105 120 120 105 105 135 75 165 75 195 105 180 120
Circle -16777216 true false 160 30 30

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

lightning
false
0
Polygon -7500403 true true 120 135 90 195 135 195 105 300 225 165 180 165 210 105 165 105 195 0 75 135

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

magnet
true
0
Polygon -7500403 true true 120 30 75 30 60 195 60 240 75 270 106 290 150 297 195 290 225 270 240 240 240 195 225 30 180 30 195 195 196 226 184 245 165 255 135 255 115 245 104 225 105 195
Polygon -16777216 true false 219 36 188 36 193 86 224 85
Polygon -16777216 true false 81 36 112 36 107 86 76 85

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

ufo side
false
0
Polygon -1 true false 0 150 15 180 60 210 120 225 180 225 240 210 285 180 300 150 300 135 285 120 240 105 195 105 150 105 105 105 60 105 15 120 0 135
Polygon -16777216 false false 105 105 60 105 15 120 0 135 0 150 15 180 60 210 120 225 180 225 240 210 285 180 300 150 300 135 285 120 240 105 210 105
Polygon -7500403 true true 60 131 90 161 135 176 165 176 210 161 240 131 225 101 195 71 150 60 105 71 75 101
Circle -16777216 false false 255 135 30
Circle -16777216 false false 180 180 30
Circle -16777216 false false 90 180 30
Circle -16777216 false false 15 135 30
Circle -7500403 true true 15 135 30
Circle -7500403 true true 90 180 30
Circle -7500403 true true 180 180 30
Circle -7500403 true true 255 135 30
Polygon -16777216 false false 150 59 105 70 75 100 60 130 90 160 135 175 165 175 210 160 240 130 225 100 195 70

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.3.0
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
