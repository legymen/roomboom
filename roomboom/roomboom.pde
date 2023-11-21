Player player;

Room[][] roomGrid;

int cols = 20; // Number of colums in the house
int rows = 20; // Number om rows in the house

int[] currentRoom = new int[2]; 

void setup() {
  fullScreen();
  
  // Create the player object
  player = new Player();
  
  // Create the 2-dim array of rooms
  roomGrid = new Room[cols][rows];
  
  // Set the starting room coordinates
  currentRoom[0] = 0;
  currentRoom[1] = 0;
  
  // Create the starting room
  roomGrid[currentRoom[0]][currentRoom[1]] = new Room(currentRoom);
}



void draw() {
  
  // Update all rooms
  roomGrid[currentRoom[0]][currentRoom[1]].update();

}
