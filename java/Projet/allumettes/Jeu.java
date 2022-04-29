package allumettes;
/** Interface pour un jeu.
* Gère le nombre d'allumettes.
* @author Guet paul-henri
* @version 1.2
*/
public interface Jeu
{
    /** Retourne le nombre actuel d'allumettes */
    /*@ pure @*/ int getNombreAllumettes();

    /*@ pure @*/ String toString();

    /** Retire un certain nombre d'allumettes.
* @param nbAllumettes le nombre d'allumettes à retirer
*/
    void retirer(int nbAllumettes) throws CoupInvalideException;
}
