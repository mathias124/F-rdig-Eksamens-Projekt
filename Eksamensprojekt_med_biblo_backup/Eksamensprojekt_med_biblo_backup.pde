String tal;
String tekst;
String print="";
String massevaerdi="";
String massevolume="";

float massedata = 0;
float atommertalhusk;
float molmasse;
float talvaerdi;
float volume = 0;

FloatList inventar = new FloatList();
FloatList Symbolatomhusker = new FloatList();

StringList Rawdata = new StringList();
StringList Vaerdiliste = new StringList();

import controlP5.*;// importeret fra biblitoteket 

ControlP5 cp5;//sætter op en variabel.

void setup() {//Denne void kører en gang, fra starten af.
  size(1000, 500);//Dette laver et vinduet af (1000 pixels ad x aksen og 500 pixels ad y-aksen.
  background(71, 113, 72);//Dette sætter stemningen og baggrunden.



  cp5= new ControlP5(this);//Dette har i sammenhæng med controlP5, gjort at man kan sige cp5 istedet for ControlP5, og (this) gør det objektorienteret, som er smart da vi skal bruge den til et objekt der er en knap.

  PFont fonten = createFont("Arial", 18);//Dette laver fonten Arial (henter da den eksistere)
  ControlFont font = new ControlFont(fonten);//Dette gør så det er en font for alle cp5 enheder.

  cp5.setFont(font);//Dette sætter det som fonten.

  cp5.addButton("VOLUME")//Tilføjer en knap med Størrelse og position.
    .setPosition(545, 113)
    .setSize(183, 35)
    ;
  cp5.addButton("masse")
    .setPosition(750, 113)
    .setSize(183, 35)
    ;
  cp5.addButton("next_stof")
    .setPosition(650, 13)
    .setSize(313, 55)
    ;
  cp5.addTextfield("Textfelt")//Dette sætter et tekstfelt fra bibloteket, herunder størrelse af textfelt og position.
    .setCaptionLabel("Stof & masse")
    .setPosition(145, 13)
    .setSize(283, 62)
    .setAutoClear(false)
    ;
  cp5.addTextfield("Textfelttal")//Dette sætter et tekstfelt fra bibloteket, herunder størrelse af textfelt og position.
    .setCaptionLabel("Tal")//Det der står under tekstfeltet.
    .setPosition(445, 13)
    .setSize(83, 62)
    .setAutoClear(false)
    ;
  tabledata();//dette gør at ved startup loader den kommanden tabledata og gør det muligt at skabe en void der hedder tabledata.
}
void draw() {//dette er en konstant void, som kører 60 gange i sekunder. Medmindre Kommanden frameRate(x) er brugt. 

  rectMode(CENTER);

  fill(255);//Farver rectanglerne vide.
  rect(335, 183, 390, 70, 6);//Skaber en rektangel.
  rect(740, 183, 410, 70, 6);
  rect(335, 318, 390, 70, 6);
  rect(740, 318, 410, 70, 6);
  rect(740, 443, 410,70,6);//Concentration
  rect(335,443,390,70,6);//Volume
  textSize(22);//Sætter Tekststørrelsen til text.
  fill(201, 0, 61);//Farver teksten
  text("Molarmasse:", 145, 323);//Sætter en Tekst med molarmasse på X og Y pixel.
  text("Stofmængde:", 540, 323);
  text("Indtastede masse:"+massevaerdi+"g", 553, 190);
  text("Dit indtaste stof:"+print, 150, 190);
  text(molmasse+"mol", 283, 323);
  text(massedata/molmasse+"g/mol", 688, 323);
  
  text("Dit indtastede volume:"+massevolume+"L",540,448);
  text("Koncentration:",145,448);
  float koncvaerdi =massedata/molmasse;
  text(koncvaerdi/volume+"mol/L",303,448);
  
          

  molmasse=0;
  for (int k=0; k < Symbolatomhusker.size(); k++) {//Et for loop der husker tidligere skrevet Symbolatomer.
    Symbolatomhusker.get(k);
    molmasse=molmasse+Symbolatomhusker.get(k);//Opdatere molmassen med nye indskrevet Symbolatomer.
  }
  print="";
  for (int l=0; l < Rawdata.size(); l++) {
    Rawdata.get(l);
    print=print+Rawdata.get(l);
  
          }
}


void masse() {//Reagere med knappen hvis den bliver trykket.
background(226,189,57);
  massevaerdi=cp5.get(Textfield.class, "Textfelt").getText();
  massedata = Float.parseFloat(massevaerdi);//konvertering.
  
  cp5.get(Textfield.class, "Textfelt").clear();
  cp5.get(Textfield.class, "Textfelttal").clear();
  taeller=-2;
}


void VOLUME() {
  background(221,92,92);  
  massevolume=cp5.get(Textfield.class, "Textfelt").getText();
  volume = Float.parseFloat(massevolume);//konvertering.
  
  cp5.get(Textfield.class, "Textfelt").clear();
  cp5.get(Textfield.class, "Textfelttal").clear();
  taeller=-2;
}
void next_stof() {//Aktivere hvis knappen bliver trykket.
background(252, 150, 107);
  tekst=cp5.get(Textfield.class, "Textfelt").getText();//Henter Stringen fra tekstfelt.
  Rawdata.append(cp5.get(Textfield.class, "Textfelt").getText());
  Rawdata.append(cp5.get(Textfield.class, "Textfelttal").getText());//Her appelere den fra textfelttal og tilføjer den til StringListen Rawdata.
  tal=cp5.get(Textfield.class, "Textfelttal").getText();//Her henter den værdien fra textfelttal og tilføjer det til Stringen tal.
  talvaerdi = Float.parseFloat(tal);//her konvertes der fra string til float.

  if (taeller==-2) {//Her appelere den til at hvis taelleren er -5, så starter programmet.
    if (Symbolatom.hasValue(tekst)) {//Her appelere den til at se tekstfeltet og hente Value hvis Tekstsfelte har noget som StringListen  Symbolatom indeholder.
      for (int j=0; j < Symbolatom.size(); j++) {//Dette er et forlob der tæller kolloner herunder tæller dens size som er på 118 Strings.
        String Hukommelse =Symbolatom.get(j);//Her laves der en variable der gemmes som Symbolsatoms for-loop værdi.
        if (Hukommelse.equals(tekst)) {//Her appelere hvis For loopets værdi som er gemt er det samme som det der står i tekstfeltet.
          taeller=j;//Så er det sandt altså Taelleren har den rigtige for loop værdi.
          println(Atommasse.get(taeller));// Dette bliver brugt til at tjekke om programmet virker ved at sætte Tekstfeltets værdi i Console. 
         String atommer = Atommasse.get(taeller);//Dette henter værdien fra tekstfeltet og hvis det passer henter den Stringliste [3] som er atommassen der passer i sizen af Symbolatom Det vil sige. Hvis der er tastet "H" vil den skrive H's atommasse ud nemlig 1.007.
          atommertalhusk =Float.parseFloat(atommer);//konvertering.Her gemmes værdien så den kan blive konverteret og husket-imens programmet kører til at blive en float så det kan blive divideret med massen (herunder massedata).
         
            break;
       
            

          
           
      }
    }
  }
  }
  Symbolatomhusker.append(atommertalhusk*talvaerdi);
  cp5.get(Textfield.class, "Textfelt").clear();
  cp5.get(Textfield.class, "Textfelttal").clear();
  taeller=-2;
}
