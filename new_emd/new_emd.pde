import processing.serial.*;

Serial mySerial;
String val;
String test = "test x test y test z";
String test1 = "test1";
int count = 0;
double x;
double y;
double z;
float x1;
float y1;
float z1;
float j = 10 ;


void setup() {
  size(1000, 700);
  mySerial = new Serial( this, "COM9", 9600 );
  background(0);
} 
void draw() {
  
  serialEvent(mySerial);
  if (test != null){
    test1 = test;
    if (test1 != null){
      
      fill(60);
      stroke(225);
      rect(0,10,999,40);
      fill(255);
      textSize(20);
      text(test1, 30, 35);
      count = count + 1;
      String[] xyz = split(test1,' ');
      
      if(count > 1000){
        String angle_x = "angleX: "+ xyz[1];
        String angle_y = "angleY: "+xyz[3];
        String angle_z = "angleZ: "+xyz[5];
        
        x = Double.parseDouble(xyz[1]);
        y = Double.parseDouble(xyz[3]);
        z = Double.parseDouble(xyz[5]);
        
        x1 = (float)x*100/180;
        y1 = (float)y*100/180;
        z1 = (float)z*100/180;
        
        j = j + 1;
          
          stroke(255,0,0);
          line(j, 200-x1, j, 200);
          stroke(0,255,0);
          line(j, 400-y1, j, 400);
          stroke(0,0,255);
          line(j, 600-z1, j, 600);
          
          if(j>990){
          j = 10;
          background(0);
          } 
          
          
        fill(60);
        stroke(255,0,0);
        rect(0,80,200,27);
        fill(225);
        text(angle_x,10,100);
        stroke(0,255,0);
        fill(60);
        rect(0,280,200,27);
        fill(225);
        text(angle_y,10,300);
        stroke(0,0,255);
        fill(60);
        rect(0,480,200,27);
        fill(225);
        text(angle_z,10,500);
      }
    }
  }
  
  stroke(255,0,0);
  line(10, 200, 990, 200);
  stroke(0,255,0);
  line(10, 400, 990, 400);
  stroke(0,0,255);
  line(10, 600, 990, 600);
  
}
void serialEvent(Serial mySerial) { 
  val = mySerial.readStringUntil('\n');
  if (val != null) {
    mySerial.clear();
    val = trim(val);    
    //println(val);
    test = val;
  }
}
