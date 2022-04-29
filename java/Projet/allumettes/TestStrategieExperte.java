package allumettes;
import org.junit.*;
import static org.junit.Assert.*;

/** Programme de test de la classe StrategieExperte
* @author Guet paul-henri
* @version 1.2
*/
public class TestStrategieExperte
{
    private Strategie strategie;

    public static void main(String[] args)
    {
        org.junit.runner.JUnitCore.main(TestStrategieExperte.class.getName());
    }

    @Before
    public void setUp()
    {
        this.strategie = new StrategieExperte();
    }

    @Test
    public void testToString()
    {
        assertEquals(this.strategie.toString(), "experte");
    }

    @Test
    public void testGetPrise()
    {
        assertEquals(this.strategie.getPrise(new JeuReel(1)), 1);
        assertEquals(this.strategie.getPrise(new JeuReel(2)), 1);
        assertEquals(this.strategie.getPrise(new JeuReel(3)), 2);
        assertEquals(this.strategie.getPrise(new JeuReel(4)), 3);
        assertEquals(this.strategie.getPrise(new JeuReel(6)), 1);
        assertEquals(this.strategie.getPrise(new JeuReel(7)), 2);
        assertEquals(this.strategie.getPrise(new JeuReel(8)), 3);
        assertEquals(this.strategie.getPrise(new JeuReel(10)), 1);
        assertEquals(this.strategie.getPrise(new JeuReel(11)), 2);
        assertEquals(this.strategie.getPrise(new JeuReel(12)), 3);
      
    }
}
