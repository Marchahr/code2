float r; 
color bgColor; 

String [] colorz;
String lastColor;

void setup(){
  size(600, 600); 
  colorz = loadStrings("colors.csv");
  lastColor = colorz[0];
  
//    for(int i = 0; i <colorz.length; i++){ 
//println(colorz[i]);
//println(colorz.length);
//lastColor = colorz[i];
 
//}

 for (int i = 0; i<colorz.length; i++) {
   if (i > i-1) {
      lastColor = colorz[i];
      //str(bgcolor)= colorz[i];
    //}if else (i<i-1){
    //  bgColor = bgColor;
    }
 }
}

void draw(){
  background(bgColor); 
  text("back ground # : " + bgColor, 100, 100); 


}

void mousePressed(){
  bgColor = color(random(0,255), random(0,255), random(0,255)); 
  ellipse(mouseX, mouseY, 50, 50); 
  
    saveStrings("colors.csv", colorz);
    colorz = append(colorz, (str(bgColor)));

}
