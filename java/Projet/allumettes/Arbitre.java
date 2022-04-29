package allumettes;
import java.util.*;
/** la classe Arbitre gère tout une partie de jeu.
* @author Guet paul-henri
* @version 0.1
*/
public class Arbitre
{
    /** Les deux joueurs. */
    protected Joueur joueur1, joueur2;

    /** Le constructeur.
* @param j1 le premier joueur
* @param j2 le second joueur
*/
    public Arbitre(Joueur j1, Joueur j2)
    {
        assert(j1 != null);
        assert(j2 != null);

        this.joueur1 = j1;
        this.joueur2 = j2;
    }

    public String toString()
    {
        return "joueur1=" + this.joueur1 + " joueur2=" + this.joueur2;
    }

    /** Jou une partie.
* @param jeu le jeu initial
*/
    public void arbitrer(JeuReel jeu)
		/*Tant que le jeu n'est pas fini,l'arbitre fait jouer
		 *chacun leur tour les joueurs
		 */
    {
        assert(jeu != null);
        assert(jeu.getNombreAllumettes() > 0);

        boolean tour_joueur1 = true;
	
        while(jeu.getNombreAllumettes() > 0) //Tant que le utilisateur ou ordinateur n'a pas pris la derniere allumettes on continue la partie
		{
            Joueur joueur = this.joueur1;
            if(!tour_joueur1)
                joueur = this.joueur2;

            System.out.println("Nb d'allumettes restantes : " + jeu.getNombreAllumettes());
            System.out.println("Au tour de " + joueur.getNom() + ".");

            try {
                int prise = joueur.getPrise(new JeuProxy(jeu));//Pour eviter la tricherie des joueurs
                System.out.println(joueur.getNom() + " prend " + prise + " allumette(s).");
                jeu.retirer(prise);
                tour_joueur1 = !tour_joueur1;
				System.out.println();
            }
            catch(CoupInvalideException e)
            {
                System.out.println("Erreur ! Prise invalide : " + e.getAllumettesRetirees());
				System.out.println("Recommencez !");
				System.out.println();
            }

            catch(InputMismatchException f) {
				System.out.println("Vous devez donner un entier compris entre 1 et 3");
			}
        }
            
        Joueur vainqueur = this.joueur1;
		Joueur perdant =this.joueur2;

        if(!tour_joueur1)

         vainqueur = this.joueur2;

        System.out.println(vainqueur.getNom() + " a gagné !");

		if(!tour_joueur1)

		perdant=this.joueur1;

		System.out.println(perdant.getNom()+ " a perdu ,dommage recommencez une nouvelle partie tout de suite si vous le souhaitez !!");
			

    } 
}
