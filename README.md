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


Tina Nguyen:
5/25/2021: Added needed variables and methods for Maze

5/27/2021: Edited some Pacman methods (lives and points methods)
5/27/2021: Added x and y variables to the Pacman class to keep track of
where it is. Also added getXCoord and getYCoord to retrieve the coordinates,
and also edited the display method for Pacman.
5/27/2021: Edited keyPressed in pacmanGame and created Pacman object. 
