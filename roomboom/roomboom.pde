HashMap<String, Boolean> pressedKeys;

Player player;

Room[][] roomGrid;

int[] currentRoom = new int[2];

String[] roomTypes = { "empty", "trap", "monster", "item" };
String[] objectTypes = { "health potion", "key", "amulette", "aa", "bb", "cc", "dd", "ee"};

int cols = 20; // Number of colums in the castle
int rows = 20; // Number om rows in the castle



void setup() {
  // fullScreen();
  size(800, 800);

  pressedKeys = new HashMap<String, Boolean>();
  pressedKeys.put("w", false);
  pressedKeys.put("s", false);
  pressedKeys.put("a", false);
  pressedKeys.put("d", false);

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

  // Update current room
  roomGrid[currentRoom[0]][currentRoom[1]].update();
}

void keyPressed() {
  pressedKeys.put(str(key), true);
}

void keyReleased() {
  pressedKeys.put(str(key), false);
}
