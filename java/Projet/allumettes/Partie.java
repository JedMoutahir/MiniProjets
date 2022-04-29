package allumettes;
/** Lance une partie des 13 allumettes en fonction des arguments fournis
 * sur la ligne de commande.
 *@author Paul-Henri Guet
* @version 1.5
*/
public class Partie
{
	
 /** Permet d'obtenir la stratégie en fonction du nom
* @param nom le nom de la stratégie
*@return la strategie choisi par le joueur
 */
	public static Strategie getStrategie(String nom)
    {
	
        String nom_strategie = nom.toLowerCase();
        
        if(nom_strategie.equals("naif")) {
            return new StrategieNaive();
		}
        else if(nom_strategie.equals("rapide")) {
            return new StrategieRapide();
		}
        else if(nom_strategie.equals("expert")){
            return new StrategieExperte();
		}
        else 
            return new StrategieHumaine();
		
    }
	/** Methode qui permet de savoir si la configuration de la strategie choisi
	 * par l'utilisateur est valide ou pas.
	 * @param saisie 
	 * @return verification
	 */
	private static boolean estValide(String saisie){
		boolean verification =  (saisie.equals("naif") || saisie.equals("expert") || saisie.equals("rapide") || saisie.equals("humain"));
		return verification;
	}
    public static void main(String[] args){
	try {
	/* Le jeu se joue avec 2 joueurs */
			Joueur joueur1;
			Joueur joueur2;
       
        if(args.length != 2)
        {
          
			throw new ConfigurationException("nombre invalide d'arguments : " +
						args.length + " au lieu de 2.");
						
        }
        else if(args[0].split("@").length != 2 || args[1].split("@").length != 2)
        {
            System.out.println("Utilisation : java allumettes.Partie  NOM_1@STRATEGIE_1 NOM_2@STRATEGIE_2");
            System.out.println("error: les arguments ont une forme incorrecte.");
        }
        else
        {
			//Creation du joueur 1 
            String[] j1 = args[0].split("@");
			if (!estValide(j1[1])) {
		    	throw new ConfigurationException("Strategie de " + 
		    			j1[1] + " invalide");
		    }
			else {
				joueur1 = new Joueur(j1[0], getStrategie(j1[1]));
			}
			//Creation du joueur 2
            String[] j2 = args[1].split("@");
			if (!estValide(j2[1])) {
		    	throw new ConfigurationException("Strategie de " + 
		    			j2[1] + " invalide");
		    }
			else {
				 joueur2 = new Joueur(j2[0], getStrategie(j2[1]));
			}
			// On indique le nombre d'allumettes qu'il y a au debut de la partie et on creer le jeu */

            JeuReel jeu = new JeuReel(13);
			  /* Creation de l'arbitre */
            Arbitre arbitre = new Arbitre(joueur1, joueur2);
            arbitre.arbitrer(jeu);
        }
	}
		catch (ConfigurationException e) {
			System.out.println();
			System.out.println("Erreur : " + e.getMessage());
			afficherUsage();
			System.exit(1);
		}
	
    }
	/** Afficher des indications sur la manière d'exécuter cette classe. */
	public static void afficherUsage() {
		System.out.println("\n" + "Usage :"
				+ "\n\t" + "java allumettes.Partie joueur1 joueur2"
				+ "\n\t\t" + "joueur est de la forme nom@stratégie"
				+ "\n\t\t" + "strategie = naif | rapide | expert | humain"
				+ "\n"
				+ "\n\t" + "Exemple :"
				+ "\n\t" + "	java allumettes.Partie Xavier@humain "
					   + "Ordinateur@naif"
				+ "\n"
				);
	}


}
