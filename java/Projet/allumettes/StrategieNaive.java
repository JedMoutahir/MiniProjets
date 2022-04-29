package allumettes;
import java.util.Random;
/** StrategieNaive correspond à une stratégie aléatoire.
* @author Guet paul-henri
* @version 1.2
*/
public class StrategieNaive implements Strategie
{
    /** Le générateur aléatoire. */
    protected Random rand;

    /** Le constructeur. */
    public StrategieNaive()
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

        return this.rand.nextInt(Math.min(JeuReel.PRISE_MAX, jeu.getNombreAllumettes())) + 1;
    }

    public String toString()
    {
        return "naive";
    }
}
