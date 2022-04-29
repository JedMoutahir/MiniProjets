package allumettes;
import java.util.Scanner;
/** StrategieHumaine correspond à une stratégie d'un utilisateur.
* @author Guet paul-henri
* @version 1.2
*/
public class StrategieHumaine implements Strategie
{
    /** Le scanner. */
    protected Scanner sc;

    /** Le constructeur. */
    public StrategieHumaine()
    {
        this.sc = new Scanner(System.in);
    }

    /** Retourne le nombre d'allumettes que la stratégie conseille de prendre.
* @param jeu le jeu actuel
*/
    /*@ pure @*/ public int getPrise(Jeu jeu)
    {
        assert(jeu != null);
        assert(jeu.getNombreAllumettes() > 0);

        int prise = 0;
        while(prise == 0)
        {
            System.out.print("Combien prenez-vous d'allumettes ? ");
            try {
                prise = Integer.parseInt(this.sc.nextLine());
            }
            catch(NumberFormatException e)
            {
                System.out.println("Vous devez donner un entier entre 1 et " + JeuReel.PRISE_MAX + ".");
            }
        }

        return prise;
    }

    public String toString()
    {
        return "humaine";
    }
}
