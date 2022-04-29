package allumettes;
/** Strategie modélise une stratégie.
* @author Guet paul-henri
* @version 1.2
*/
public interface Strategie
{
    /** Retourne le nombre d'allumettes que la stratégie conseille de prendre.
* @param jeu le jeu actuel
*/
    int getPrise(Jeu jeu);
}
