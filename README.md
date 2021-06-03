# APCSFinalProject
Group Name: Bent Ben Ten

Group Members: Emma Buller, Tina Nguyen

Brief Project Description: We will be implementing Pac-man in Processing. The game will be controlled by user input through the arrow keys. The objective will be the same (capturing all the pellets) and there will be obstacles (the colorful ghosts) following it around.

Google Doc: https://docs.google.com/document/d/1WgVaVSX-P7kjcDoPgB-GkoTZ6AfqmNU8nm1lXzTBwvI/edit?usp=sharing

Development Log:

Emma Buller:
5/25/2021: Created the files in processing

5/25/2021: Created needed variables and methods for Pacman class

5/25/2021: Created needed methods for pellet and wall

5/25/2021: Created needed methods for ghost class

5/25/2021: Edited game and maze methods

5/26/2021: Realized that we didn't need maze class to do
what it was supposed to do (store objects in an array) and
moved those variables to the main file. I found another
purpose for the Maze class. I had all of the classes
extend the maze class so that we could use universal methods
such as display for all of the objects in the game array.
I also worked on displaying the pellets and walls. I began
implementing the displaying of different types of walls
but i realize that it only works for when its at the edge.
Will fix this tomorrow.

5/27/2021: Added the top left corner and modified how to make the walls (made the walls work so that it can work properly no matter where in the array the walls were)

5/28/2021: Modified Tina's code to make Pacman move. I did this
by making a setXChord/setYChord methods to change the center
of the circle. This moved the pacman, but it left a trail. I
erased that by drawing a black circle at the spots the pacman
was in previously. I also changed how much the pacman moved
horizontally and vertically.

5/29/2021: Got rid of the small yellow residue that was left
from the movement of pacman

5/29/2021: Displayed points and lives

5/29/2021: Displayed ghost

5/30/2021: Got redGhost to move to its target tile in an uniform time

5/30/2021: Made pink ghost and orange ghost subclasses

6/1/2021 (early morning): Added blue ghost subclass

6/1/2021: Made the elements restart in their initial positions once pacman touches a ghost

6/1/2021: Game ends once pacman loses all 3 lives

Tina Nguyen:

5/25/2021: Added needed variables and methods for Maze

5/27/2021: Edited some Pacman methods (lives and points methods)

5/27/2021: Added x and y variables to the Pacman class to keep track of
where it is. Also added getXCoord and getYCoord to retrieve the coordinates,
and also edited the display method for Pacman.

5/27/2021: Edited keyPressed in pacmanGame and created Pacman object.

06/01/2021: Added accessor methods for points and lives in Pacman class and
moved lives to the top of the screen.

06/01/2021: Added boundaries to Pacman so it can't go past the walls and
stays on the last pellet unless it's told to move another direction

06/01/2021: Added accessor methods for the x and y variables in the Pellet
class for use in the main pacmanGame file. Will figure out how to make it
disappear later

06/01/2021: Added boundaries to the ghosts' movement so that it can't go past
the walls and goes in other directions if movement is not possible in one
direction

06/03/2021: Implemented pellets getting eaten and adding to the points; however
the displaying of the points should be fixed. Pellets disappear after being touched
by the pacman. There are now variables and functions in the pellet class to indicate
whether it has been eaten or not and it's connected by the maze class.

06/03/2021: Fixed a mistake where the walls would not show. I had further complicated
things with the code that implemented pellets being eaten, but it's fixed now.

06/03/2021: Added the display of a final score at the end screen. However, the points
adding up are incorrect. Will work on that.

06/03/2021: Fixed the displaying of points. The points still aren't adding up correctly
but I plan on using a boolean to make sure that points would add up from empty spots.

06/03/2021: Fixed the addition of points. Each pellet is worth 10 points and it doesn't  
overadd for pellets that have been eaten already.

06/03/2021: Instead of displaying the number of lives, the number of lives is represented
by pacmans (yellow circles for now). I also removed the yellow old pacmans at the bottom
since we moved lives to the top of the screen.
