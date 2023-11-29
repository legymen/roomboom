int GUI_WIDTH = 400;
int ROOM_WIDTH = 700;
int COLS = 20; // Number of colums in the castle
int ROWS = 20; // Number om rows in the castle

String POTION_IMAGE = "data/health_potion.png";
String KEY_IMAGE = "data/golden_key.png";



HashMap<Character, Boolean> pressedKeys; // Hashmap for keeping track of pressed keys

Player player; 

GUI gui;

Room[][] roomGrid; // A 2-dim array for all room objects

int[] currentRoom = new int[2]; // An array of length 2 for the column and row of the current room

// Arrays for the various types of rooms and items
String[] roomTypes = { "empty", "trap", "item" };
String[] itemTypes = { "potion", "key"};





void setup() {
    fullScreen();
    // size(1210, 800);
    
    gui = new GUI();
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
    roomGrid = new Room[COLS][ROWS];
    
    //Set the starting room coordinates
    currentRoom[0] = 0;
    currentRoom[1] = 0;
    
    //Create the starting room
    roomGrid[currentRoom[0]][currentRoom[1]] = new Room(currentRoom);
}



void draw() {
    //Update current room
    background(180);

    roomGrid[currentRoom[0]][currentRoom[1]].update();

    gui.update();
}

void keyPressed() {
    pressedKeys.put(key, true);
}

void keyReleased() {
    pressedKeys.put(key, false);
}
