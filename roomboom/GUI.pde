class GUI {
  String GOLD_BAG_IMAGE = "data/gold_bag.png";
  int xSizeGUI, ySizeGUI;
  float heartSize;
  float slotSize;
  PImage img;
  
  
  GUI()  {
    img = loadImage(GOLD_BAG_IMAGE); //Retrieving Golden bag image
    heartSize = 40;
    slotSize = 50;
    xSizeGUI = 375;
    ySizeGUI = 790;
    
  }
  
  
  void update() {
    display();
  }
  
  void display(){
    //Background for the GUI
    rectMode(CORNER);
    fill(30);
    rect(5, 5, xSizeGUI, ySizeGUI, 5);
    
    //Displays Health
    for (int i = 0; i < player.maxHP; i++) {
      fill(255, 0, 0);
      if (i > player.HP)
        fill(100);
      rect((heartSize*i)+(i*5)+25, 25, heartSize, heartSize);
    }
    
    //Displays Gold
    fill(142, 126, 36);
    rect(25, 80, 175, 50);
    fill(30);
    rect(70, 90, 120, 30);
    textSize(25);
    fill(0);
    text(str(player.gold), 82, 116); //Gives the text an outline
    fill(222, 199, 72);
    text(str(player.gold), 80, 115); //Display Gold Count
    image(img, 50, 105); //Displays golden bag image
    
    //Displays Inventory GUI
    textSize(30);
    fill(0);
    text("Inventory", 27, 161); //Gives the text an outline
    fill(220);
    text("Inventory", 25, 160); //Inventory Text
    //slots
    fill(100);
    for (int i = 0; i < player.maxInv; i++) {
      int calcRowTotal = (xSizeGUI-30)/(int(slotSize)+5); //Calculates how many slots fits in the GUI in a row
      int rows = (i/calcRowTotal);
      rect((slotSize*(i-calcRowTotal*rows))+((i-calcRowTotal*rows)*5)+25, 175+(60*rows), slotSize, slotSize);
    
    }
    //Puts the image of the item into the inventory
    for (Item it : player.inventory) {
      int i = player.inventory.indexOf(it)+1;
      int calcRowTotal = (xSizeGUI-30)/(int(slotSize)+5); //Calculates how many slots fits in the GUI in a row
      int rows = ((i-1)/calcRowTotal);
      image(it.img, (slotSize*(i-calcRowTotal*rows))+((i-calcRowTotal*rows)*5)-1.25, 201+(60*rows));
    }
  }
}
