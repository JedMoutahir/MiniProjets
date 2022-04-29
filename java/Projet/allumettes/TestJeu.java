package allumettes;
import org.junit.*;
import static org.junit.Assert.*;

/** Programme de test de la classe Jeu
* @author Guet paul-henri
* @version 1.2
*/
public class TestJeu
{
    private JeuReel jeu;

    public static void main(String[] args)
    {
        org.junit.runner.JUnitCore.main(TestJeu.class.getName());
    }

    @Before
    public void setUp()
    {
        this.jeu = new JeuReel(13);
    }

    @Test
    public void testPriseMax()
    {
        assertEquals(JeuReel.PRISE_MAX, 3);
    }

    @Test(expected=AssertionError.class)
    public void testConstructeur1()
    {
        new JeuReel(0);
    }
    
    @Test(expected=AssertionError.class)
    public void testConstructeur2()
    {
        new JeuReel(-1);
    }
    
    @Test(expected=CoupInvalideException.class)
    public void testRetirer1() throws Exception
    {
        this.jeu.retirer(-1);
    }
    
    @Test(expected=CoupInvalideException.class)
    public void testRetirer2() throws Exception
    {
        this.jeu.retirer(14);
    }

    @Test
    public void testRetirer3() throws Exception
    {
        assertEquals(this.jeu.getNombreAllumettes(), 13);
        this.jeu.retirer(3);
        assertEquals(this.jeu.getNombreAllumettes(), 10);
        this.jeu.retirer(2);
        assertEquals(this.jeu.getNombreAllumettes(), 8);
		this.jeu.retirer(3);
		assertEquals(this.jeu.getNombreAllumettes(),5);
		this.jeu.retirer(1);
		assertEquals(this.jeu.getNombreAllumettes(),4);


    }
}
