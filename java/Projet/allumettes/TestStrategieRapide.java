package allumettes;
import org.junit.*;
import static org.junit.Assert.*;

/** Programme de test de la classe Strategie Rapide
* @author Guet paul-henri
*  @version 1.2
*/
public class TestStrategieRapide
{
    private Strategie strategie;

    public static void main(String[] args)
    {
        org.junit.runner.JUnitCore.main(TestStrategieRapide.class.getName());
    }

    @Before
    public void setUp()
    {
        this.strategie = new StrategieRapide();
    }

    @Test
    public void testToString()
    {
        assertEquals(this.strategie.toString(), "rapide");
    }

    @Test
    public void testGetPrise()
    {
        assertEquals(this.strategie.getPrise(new JeuReel(3)), 3);
      
      }
}
