package allumettes;
import java.util.Random;
/** StrategieExperte correspond à la meilleure stratégie possible.
* @author Guet paul-henri
* @version 1.2
*/
public class StrategieExperte implements Strategie
{
    /** Le générateur aléatoire. */
    protected Random rand;

    /** Le constructeur. */
    public StrategieExperte()
    {
        this.rand = new Random();
    }

    /** Retourne le nombre d'allumettes que la stratégie conseille de prendre.
* @param jeu le jeu actuel
*/
    /*@ pure @*/ public int getPrise(Jeu jeu)
    {
        assert(jeu != null);
        assert(jeu.getNombreAllumettes() > 0);

        int n = jeu.getNombreAllumettes();

        if((n - 1) % (JeuReel.PRISE_MAX + 1) == 0) // mauvaise posture : tirage aléatoire
        {
            return this.rand.nextInt(Math.min(JeuReel.PRISE_MAX, n)) + 1;
        }
        else // victoire assurée
        {
            return (n - 1) % (JeuReel.PRISE_MAX + 1);
        }
    }

    public String toString()
    {
        return "experte";
    }
}
