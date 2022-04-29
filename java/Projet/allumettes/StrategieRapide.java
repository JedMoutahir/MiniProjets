package allumettes;
import java.util.*;

/** StrategieRapide correspond à une stratégie qui prend toujours le maximum
* d'allumettes possible.
* @author Guet paul-henri
* @version 1.2
*/
public class StrategieRapide implements Strategie
{
    /** Le constructeur. */
    public StrategieRapide() {}

    /** Retourne le nombre d'allumettes que la stratégie conseille de prendre.
* @param jeu le jeu actuel
*/
    /*@ pure @*/ public int getPrise(Jeu jeu)
    {
        assert(jeu != null);
        assert(jeu.getNombreAllumettes() > 0);

        return Math.min(JeuReel.PRISE_MAX, jeu.getNombreAllumettes());
    }

    public String toString()
    {
        return "rapide";
    }
}
