package allumettes;
/** Jeu représente le jeu. Il gère uniquement les allumettes.
* @author Guet paul-henri
* @version 1.2
*/
public class JeuReel implements Jeu
{
    /** Nombre maximal d'allumettes que peut prendre un joueur en un tour. */
    public static final int PRISE_MAX = 3;

    /** Le nombre actuel d'allumettes */
    protected int nb_allumettes;

    /** Le constructeur.
* @param allumettes le nombre initial d'allumettes
*/
    public JeuReel(int allumettes)
    {
        assert(allumettes > 0);
        this.nb_allumettes = allumettes;
    }

    /** Retourne le nombre actuel d'allumettes */
    /*@ pure @*/ public int getNombreAllumettes()
    {
        return this.nb_allumettes;
    }

    /*@ pure @*/ public String toString()
    {
        return " nb_allumettes=" + this.nb_allumettes;
    }

    /** Retire un certain nombre d'allumettes.
* @param nbAllumettes le nombre d'allumettes à retirer
*/
    public void retirer(int nbAllumettes) throws CoupInvalideException
    {
        if(nbAllumettes > 0 && nbAllumettes <= JeuReel.PRISE_MAX && nbAllumettes <= this.nb_allumettes)
        {
            this.nb_allumettes -= nbAllumettes;
        }
        else
        {
            throw new CoupInvalideException(nbAllumettes);
        }
    }
}
