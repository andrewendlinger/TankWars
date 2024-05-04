// <-- Hier werden Variable erstellt --> 
// Variable können Zahlen, Text, Bilder und mehr speichern

// Kommazahlen


// ganze Zahlen


// Bilder


// Text
String gewinnerText;

// Anderes
PVector kugelPosition;
PVector kugelGeschwindigkeit;
PVector gravitation;

boolean spielLäuft;

// <-- void setup() wird einmal am Anfang ausgeführt
// Hier werden Variablen auf ihren Startwert gesetzt
void setup(){
  size(800, 400);
  
  spielLäuft = true;
  
}


// <-- void draw() wird mehrmals pro Sekunde ausgeführt
// Hier werden Objekte gezeichnet und bewegt
void draw(){
  background(0);
  
  if(spielLäuft){
    
    kugelBewegen();
    spielerGetroffen();
    wandGetroffen();
    
    
  } else{
    
  }
}

void istSpielVorbei(){
 
  
}

void lebenZeichnen(){
 
}

void zielLinieZeichnen(){
  
}

void keyPressed(){
  
}

// <-- Untenstehenden Code bitte nicht ändern -->
// Hier wird überprüft ob ein Spieler oder die Wand getroffen wurde
// und die Bewegung von der Kugel wird berechnet

void wandGetroffen(){
  fill(150);
  rect(375, 200, 50, 100);
  
  if(kugelPosition == null){
    return;
  }
  
  if(kugelPosition.x > 375 && kugelPosition.x < 425 && kugelPosition.y > 200 && kugelPosition.y < 300){
    kugelPosition = null;
    if(spielerAmZug == 1){
      spielerAmZug = 2;
    } else if (spielerAmZug == 2){
      spielerAmZug = 1;
    }
  }
}

void spielerGetroffen(){
  if(kugelPosition == null){
    return;
  }
  
  int spielerSize = 20;
  
  if(spielerAmZug == 2 && kugelPosition.x > spieler1X - spielerSize && kugelPosition.x < spieler1X + spielerSize && kugelPosition.y > spieler1Y - spielerSize && kugelPosition.y < spieler1Y + spielerSize){
    println("spieler 1 getroffen");
    kugelPosition = null;
    spieler1X = spieler1X + kugelGeschwindigkeit.x * 2;
    spieler1Leben = spieler1Leben - 1;
    spielerAmZug = 1;
  }else if(spielerAmZug == 1 && kugelPosition.x > spieler2X - spielerSize && kugelPosition.x < spieler2X + spielerSize && kugelPosition.y > spieler2Y - spielerSize && kugelPosition.y < spieler2Y + spielerSize){
    println("spieler 2 getroffen");
    kugelPosition = null;
    spieler2X = spieler2X + kugelGeschwindigkeit.x * 2;
    spieler2Leben = spieler2Leben - 1;
    spielerAmZug = 2;
  }
  

}

void kugelBewegen(){
  if(kugelPosition == null){
    return;
  }
  
  kugelPosition.add(kugelGeschwindigkeit);
  kugelGeschwindigkeit.add(gravitation);
  
  if(kugelPosition.x < 0 || kugelPosition.y > height || kugelPosition.x > width){
    kugelPosition = null;
    if(spielerAmZug == 1){
      spielerAmZug = 2;
    } else if(spielerAmZug == 2){
      spielerAmZug = 1;
    }
    
    return;
  }
   
  circle(kugelPosition.x, kugelPosition.y, 20);
}

void schießen(){
  if(kugelPosition != null){
    return;
  }
  
  PVector mausPosition = new PVector(mouseX, mouseY);
  
  if(spielerAmZug == 1){
    PVector spielerPosition = new PVector(spieler1X, spieler1Y);  
    kugelPosition = new PVector(spieler1X, spieler1Y);
    kugelGeschwindigkeit = spielerPosition.sub(mausPosition);
    kugelGeschwindigkeit.y *= -0.05;
    kugelGeschwindigkeit.x *= -0.05;
  } else if(spielerAmZug == 2){
    PVector spielerPosition = new PVector(spieler2X, spieler2Y);  
    kugelPosition = new PVector(spieler2X, spieler2Y);
    kugelGeschwindigkeit = spielerPosition.sub(mausPosition);
    kugelGeschwindigkeit.y *= -0.05;
    kugelGeschwindigkeit.x *= -0.05;
  }
  
  gravitation = new PVector(0, 0.2);
}
