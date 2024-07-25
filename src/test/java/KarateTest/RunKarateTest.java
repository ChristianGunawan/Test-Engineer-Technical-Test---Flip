package KarateTest;

import com.intuit.karate.junit5.Karate;

//@RunWith(Karate.class)
public class RunKarateTest {
    @Karate.Test
    Karate testAll() {
        return Karate.run("WeatherTesting").relativeTo(getClass());
    }
}
