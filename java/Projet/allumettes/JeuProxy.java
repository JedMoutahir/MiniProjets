package allumettes;
/** Classe proxy qui empêche l'appel à retirer()
* @author Guet paul-henri
* @version 1.2
*/
public class JeuProxy implements Jeu
{
    /* Le véritable jeu. */
    protected Jeu jeu;

    /** Le constructeur.
* @param jeu le véritable jeu
*/
    public JeuProxy(Jeu jeu)
    {
        assert(jeu != null);
        this.jeu = jeu;
    }
    
    /** Retourne le nombre actuel d'allumettes */
    /*@ pure @*/ public int getNombreAllumettes()
    {
        return this.jeu.getNombreAllumettes();
    }

    public String toString()
    {
        return this.jeu + " (lecture seule)";
    }

    /** Retire un certain nombre d'allumettes avec une exception si il y a triche
* @param nbAllumettes le nombre d'allumettes à retirer
*/
    public void retirer(int nbAllumettes) throws CoupInvalideException
    {
        throw new OperationImpossibleException();
    }
}
