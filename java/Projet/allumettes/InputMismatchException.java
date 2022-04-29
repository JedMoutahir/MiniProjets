package allumettes;
/** Cette exception indique un appel interdit à retirer()
 * * @author Guet paul-henri
 * * @version 1.2
 * */
public class InputMismatchException extends RuntimeException
{
	    /** Création de l'exception */
	    public InputMismatchException()
			    {
				super("Vous devez donner un entier compris entre 1 et 3");
				}			  
}
