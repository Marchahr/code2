String text = "A unicorn has a horn in a mythological creature";

int order = 3;

int generatedTextLength = 100;

//hashmap stores a collection
//instead of array and index to access the location but this ueses a key to accesss the data 

HashMap<String, ArrayList<String>>chain;

void setup(){
size (600,600);

//be be above or in setup
chain = new HashMap<String, ArrayList<String>>();


//-order so we don't get out of bounds index
for(int i=0; i<text.length()-order; i++){
  String gram = text.substring(i, i+order);
  //creating the chunks of 3 at a time
  
ArrayList<String> characters;

//if current 3 letter chunk is not contained in chunk then create a new string array
//arraylist is flexible so we can keep pusing more into it
if(!chain.containsKey(gram)){
characters = new ArrayList<String>();
chain.put(gram, characters);
}else{
  characters = chain.get(gram);
}
 characters.add(text.substring(i+order, i+order+1));
}
}

void draw(){
  //background(0);
  
  fill(255);
  textAlign(CENTER);
  text(result, width/4, height/4, width/2, height/2);
}

String result = " ";

void mousePressed(){
  background(random(0,100),random(0,100),random(0,100));
 String currentGram = text.substring(0, order);
 result = currentGram;
 for(int i = 0; i<generatedTextLength; i++){
    if(chain.containsKey(currentGram)){
      ArrayList<String> characters = chain.get(currentGram);
    result += characters.get(round(random(characters.size()-1))); 
    currentGram = result.substring(result.length()-order, result.length());
  }
 }
}
