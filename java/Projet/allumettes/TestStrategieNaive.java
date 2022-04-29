package allumettes;
import org.junit.*;
import static org.junit.Assert.*;

/** Programme de test de la classe Strategie Experte
* @author Guet paul-henri
* @version 1.2
*/
public class TestStrategieNaive
{
    private Strategie strategie;

    public static void main(String[] args)
    {
        org.junit.runner.JUnitCore.main(TestStrategieExperte.class.getName());
    }

    @Before
    public void setUp()
    {
        this.strategie = new StrategieNaive();
    }

    @Test
    public void testToString()
    {
        assertEquals(this.strategie.toString(), "naive");
    }

 @Test
    public void testGetPrise()
    {
        assertEquals(this.strategie.getPrise(new JeuReel(1)), 3);
        assertEquals(this.strategie.getPrise(new JeuReel(2)), 3 );
        assertEquals(this.strategie.getPrise(new JeuReel(3)), 2);
              
    }
}
