StringList Atomnummer = new StringList();
StringList Symbolatom = new StringList();
StringList Atommasse = new StringList();
String textfeldt;
int taeller = -2;

void tabledata() {

String[] lines = loadStrings("PTOF.csv");


  for (int i =1; i < lines.length; i++) {
     String[]list=(split(lines[i],','));
     Atomnummer.append(list[0]);
     Symbolatom.append(list[2]); 
     Atommasse.append(list[3]);  
  }
  

  }
