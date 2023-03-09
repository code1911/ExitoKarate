package reto.features;

import com.intuit.karate.junit5.Karate;

public class runnerEmployee {

    @Karate.Test
    public Karate employee(){
        return Karate.run().relativeTo(getClass());
    }

}
