package allumettes;
/** ExempleTriche est une stratégie pour supprime la tricherie d'un des joueurs * @author Guet paul-henri
* @version 1.2
*/
public class ExempleTriche implements Strategie
{
    /** Constructeur par defaut. */
    public ExempleTriche() 
	{}

 /** Retourne le nombre d'allumettes que la stratégie conseille de prendre.
* @param jeu le jeu actuel
*/
     public int getPrise(Jeu jeu)
    {
        assert(jeu != null);
        assert(jeu.getNombreAllumettes() > 0);

        try {
            jeu.retirer(jeu.getNombreAllumettes() - 2);
        }
        catch(CoupInvalideException e)
        {
            System.out.println(e);
        }

        return 1;
    }

    public String toString()
    {
        return "Tu as triche";
    }

    public static void main(String[] args)
    {
        JeuReel jeu = new JeuReel(13);
        Joueur joueur1 = new Joueur("tricheur", new ExempleTriche());
        Joueur joueur2 = new Joueur("ordinateur", new StrategieExperte());
        Arbitre arbitre = new Arbitre(joueur1, joueur2);
        arbitre.arbitrer(jeu);
    }
}



