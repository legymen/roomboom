class Object{  
    String description;
    String type;
    float xpos, ypos;
    PImage img;
    
    Object(String _type) {
        type = _type;
        img = loadImage("data/health_potion.png");
        xpos = width/2;
        ypos = height/2;
    }
    
    void display() {
        image(img, xpos, ypos);
    }
    
    
    
    
}