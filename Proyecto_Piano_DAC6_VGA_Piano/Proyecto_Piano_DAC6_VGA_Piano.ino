void send_tecla(int teclaInt);
void setup() {
 Serial.begin(9600);
  int numberPin;
  //op code
  for (numberPin=22; numberPin<=27; numberPin++){
   pinMode(numberPin, OUTPUT);
  } 
}

void loop() {
  check_terminal();
}
void check_terminal(){
  char command[255];
  char *action;
  char *tecla;
  int teclaInt; 
  int i=0;
  while(Serial.available()>0){
    command[i]=Serial.read();
    i++;
  }
  command[i] = '\0';
  action = strtok(command,",");
  delay(100);
  if(strcmp(action,"tocar")==0){
    tecla = strtok(NULL,",");
    while(tecla != NULL){
      teclaInt = atoi(tecla);
      send_tecla(teclaInt);
      tecla = strtok(NULL,",");
    }
  send_tecla(0);
  }
}
void send_tecla(int teclaInt){
  int teclado_BI[6];
  int i;
  Serial.println(teclaInt);
   for(i=5;i>=0;i--)
    {
      teclado_BI[i]=teclaInt%2;
      teclaInt=teclaInt/2; 
     }
    for(i=0;i<6;i++){
      digitalWrite(22+i,teclado_BI[5 -i]);
     }  
   delay(1000);
}
