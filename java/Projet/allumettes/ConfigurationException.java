package allumettes;
/** Cette exception indique un appel interdit à retirer()
* @author Guet paul-henri
* @version 1.2
*/
public class ConfigurationException extends RuntimeException
{
    /** Création de l'exception */
    public ConfigurationException(String nb)
    {
        super(nb);
    }
}
