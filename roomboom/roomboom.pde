HashMap<Character, Boolean> pressedKeys; // Hashmap for keeping track of pressed keys

Player player; 

Room[][] roomGrid; // A 2x2 array for all room objects

int[] currentRoom = new int[2]; // An array of length 2 for the column and row of the current room

// Arrays for the various types of rooms and items
String[] roomTypes = { "empty", "trap", "monster", "item" };
String[] itemTypes = { "potion", "key", "amulette"};

int cols = 20; // Number of colums in the castle
int rows = 20; // Number om rows in the castle



void setup() {
    //fullScreen();
    size(800, 800);
    
    //Create the pressedKeys hashmap
    pressedKeys = new HashMap<Character, Boolean>();
    //Keys that are used are set to false
    pressedKeys.put('w', false);
    pressedKeys.put('s', false);
    pressedKeys.put('a', false);
    pressedKeys.put('d', false);
    
    //Create the player object
    player = new Player();
    
    //Create the 2-dim array of rooms
    roomGrid = new Room[cols][rows];
    
    //Set the starting room coordinates
    currentRoom[0] = 0;
    currentRoom[1] = 0;
    
    //Create the starting room
    roomGrid[currentRoom[0]][currentRoom[1]] = new Room(currentRoom);
}



void draw() {
    //Update current room
    roomGrid[currentRoom[0]][currentRoom[1]].update();
}

void keyPressed() {
    pressedKeys.put(key, true);
}

void keyReleased() {
    pressedKeys.put(key, false);
}