package allumettes;
/** Cette exception indique que le nombre d'allumettes à retirer est invalide.
* @author Guet paul-henri
* @version 1.2
*/
public class CoupInvalideException extends Exception
{
    /** Nombre d'allumettes retirées */
    protected int allumettes_retirees;

    /** Création de l'exception
* @param allumettes_retirees le nombre d'allumettes retirées
*/
    public CoupInvalideException(int allumettes_retirees)
    {
        super("Impossible de retirer " + allumettes_retirees + " allumette(s)");
        this.allumettes_retirees = allumettes_retirees;
    }

    /** Retourne le nombre d'allumettes retirées */
    /*@ pure @*/ public int getAllumettesRetirees()
    {
        return this.allumettes_retirees;
    }
}
