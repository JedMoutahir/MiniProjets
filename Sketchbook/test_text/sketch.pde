
// Programme processing
// généré avec le générateur de code Processing
// www.mon-club-elec.fr 
// par X. HINAULT - Février 2011 - tous droits réservés

/////////////// Description du programme //////////// 
// Utilise un/des objets String (chaîne de caractère)
// Utilise le port Serie
// Utilise la librairie GUI controlP5
// Utilise un/des bouton(s) simple(s) (Button)
// Utilise un/des champ(s) texte (Textfield)
// Ajoute un bouton et un champ pour chemin fichier

/*
Envoie vers Arduino une chaîne saisie dans un champ texte. 
Reçoit la chaine renvoyée par Arduino et l'affiche dans la console. 
*/

// XXXXXXXXXXXXXXXXXXXXXX ENTETE DECLARATIVE XXXXXXXXXXXXXXXXXXXXXX 

// inclusion des librairies utilisées 

import processing.serial.*; // importe la librairie série processing

import controlP5.*; // importe la librairie GUI controlP5
// cette librairie doit être présente dans le répertoire /libraries du répertoire Processing
// voir ici : http://www.sojamo.de/libraries/controlP5/

// déclaration objets 

String str1 = "machaine"; // déclare un objet String (chaine de caractère) 
String chaineEnvoi = ""; // déclare un objet String (chaine de caractère) 

// --- port Série --- 
Serial  myPort; // Création objet désignant le port série

ControlP5 controlP5; // déclare un objet principal de la librairie GUI controlP5


Button envoiButton; // déclare objet Button  

Textfield chaineText; // déclare des objets Textfield 

// déclaration variables globales 

//------ déclaration des variables de couleur utiles ---- 
int jaune=color(255,255,0); 
int vert=color(0,255,0); 
int rouge=color(255,0,0); 
int bleu=color(0,0,255); 
int noir=color(0,0,0); 
int blanc=color(255,255,255); 
int bleuclair=color(0,255,255); 
int violet=color(255,0,255); 


// XXXXXXXXXXXXXXXXXXXXXX  Fonction SETUP XXXXXXXXXXXXXXXXXXXXXX 
void setup(){ // fonction d'initialisation exécutée 1 fois au démarrage
        //size(800, 260); // ouvre une fenêtre xpixels  x ypixels
        // ---- initialisation paramètres graphiques utilisés
        colorMode(RGB, 255,255,255); // fixe format couleur R G B pour fill, stroke, etc...
        fill(0,0,255); // couleur remplissage RGB
        stroke(0,0,0); // couleur pourtour RGB
        rectMode(CORNER); // origine rectangle : CORNER = coin sup gauche | CENTER : centre 
        imageMode(CORNER); // origine image : CORNER = coin sup gauche | CENTER : centre
        //strokeWeight(0); // largeur pourtour
        frameRate(30);// Images par seconde

        // --- initialisation fenêtre de base --- 
        
        background(0,0,0); // couleur fond fenetre

// --- initialisation des objets et fonctionnalités utilisées --- 

        //------------- initialisation port série ---- 
        println(Serial.list()); // affiche dans la console la liste des ports séries
        // Vérifier que le numéro du port série utilisé est le meme que celui utilisé avec  Serial.list()[index] 
        myPort = new Serial(this, Serial.list()[0], 115200); // Initialise une nouvelle instance du port Série
        //myPort = new Serial(this, "/dev/ttyUSB0", 115200); // Initialise une nouvelle instance du port Série
        myPort.bufferUntil('\n'); // attendre arrivée d'un saut de ligne pour générer évènement série

        //======== Initialisation Objets GUI ControlP5 =========

        controlP5 = new ControlP5(this); // initialise l'objet principal de la librairie GUI controlP5

        // typeObjet nomObjet=controlP5.addObjet(paramètres); // pour info : déclaration / initialisation possible en 1 ligne
        // Textfield field = controlP5.addTextfield("myWindowTextfield",70,130,100,20); // exemple

        //======== Initialisation Objets Button =========

        //---- le bouton envoi chaine
        envoiButton=controlP5.addButton("envoiButton",0,width-60,height-40,50,24); // initialise et ajoute un Button au ControlP5
        envoiButton.setLabelVisible(true); // affichage des labels
        envoiButton.setLabel("ENVOI"); // fixe label du bouton
        envoiButton.setColorActive(color(255,0,0)); // fixe la couleur active
        envoiButton.setColorForeground(color(0,255,255)); // fixe couleur avant 

        //======== Initialisation Objets Textfield =========

        //---- champ texte saisie chaine
        chaineText=controlP5.addTextfield("cheminText",10,height-40,300,20); // initialise et ajoute un Textfield au ControlP5
        chaineText.setAutoClear(false); // autoeffacement après return
        chaineText.setValue(chaineEnvoi); // initialise Texte du champ
        chaineText.setLabelVisible(true); // affichage des labels
        chaineText.setLabel("CHEMIN"); // fixe label
        chaineText.setColorActive(color(255,0,0)); // fixe la couleur active
        chaineText.setColorForeground(color(0,255,255)); // fixe couleur avant 




} // fin fonction Setup

// XXXXXXXXXXXXXXXXXXXXXX Fonction Draw XXXXXXXXXXXXXXXXXXXX 

void  draw() { // fonction exécutée en boucle



} // fin de la fonction draw()

// XXXXXXXXXXXXXXXXXXXXXX Autres Fonctions XXXXXXXXXXXXXXXXXXXXXX 

        //------------- Fonction de gestion des évènements série ---- 
         void serialEvent (Serial myPort) { // fonction appelée lors de la survenue d'un évènement série

        // ******** Gestion de la valeur reçue sur le port série : **********

        String inString = myPort.readStringUntil('\n'); // chaine stockant la chaîne reçue sur le port Série 
        // saut de ligne en marque de fin

        if (inString != null) { // si la chaine recue n'est pas vide


                print (inString); // affichage brut de la chaine recue


        } // fin condition chaine recue pas vide


} // fin de la fonction de gestion des évènements Série

// Gestion des évènements des objets GUI controlP5 ----

//------ fonction gestion globale des évènements GUI controlP5
public void controlEvent(ControlEvent theEvent) {
        //println(theEvent.controller().name());// affiche le nom de l'évènement
}

        //---- evenement bouton envoi chaine

void envoiButton(int theValue) { // fonction évènement Button de meme nom - reçoit la valeur

        println("Evènement envoiButton");

        myPort.write(chaineText.getText()+"\n"); // envoie la chaine suivi saut ligne sur le port Série
        print("Envoi de la chaine :"); 
        print(chaineText.getText()+"\n"); 
        chaineText.setValue(""); // vide le champ texte


} // fin evènement bouton envoi

// ------ gestion évènement Textfield ------

        //---- evenement champ texte chemin fichier 

public void chaineText(String theText) { // fonction évènement Textfield de meme nom - déclenché par return - reçoit la chaine

        //println("Evènement CheminText avec valeur = "+theText);

        chaineEnvoi=theText; // mémorise le contenu du champ

        //println("Le chemin est :"+chaineEnvoi);

} // fin evènement champ texte chemin fichier


//XXXXXXXXXXXXXXXXXX Fin du programme XXXXXXXXXXXXXXXXX