package allumettes;
/** Cette classe représente un joueur.
* @author Guet paul -henri
* @version 1.2
*/
public class Joueur
{
    /** Le nom du joueur */
    protected String nom;

    /** La stratégie du joueur */
    protected Strategie strategie;

    /** Création d'un joueur.
* @param nom le nom du joueur
* @param strategie la stratégie du joueur
*/
    public Joueur(String nom, Strategie strategie)
    {
        assert(nom != null);
        assert(strategie != null);

        this.nom = nom;
        this.strategie = strategie;
    }

    /** Retourne le nombre d'allumettes que le joueur prend.
* @param jeu le jeu actuel
*/
    public int getPrise(Jeu jeu)
    {
        assert(jeu != null);
        assert(jeu.getNombreAllumettes() > 0);
        return this.strategie.getPrise(jeu);
    }

    /** Retourne le nom du joueur. */
    public String getNom()
    {
        return this.nom;
    }

    /** Retourne la stratégie du joueur. */
    public Strategie getStrategie()
    {
        return this.strategie;
    }

    /** Modifie la strategie du joueur.
* @param nouvelle_strategie la nouvelle stratégie
*/
    public void setStrategie(Strategie nouvelle_strategie)
    {
        assert(nouvelle_strategie != null);
        this.strategie = nouvelle_strategie;
    }

    public String toString()
    {
        return this.nom + " (" + this.strategie + ")";
    }
}
