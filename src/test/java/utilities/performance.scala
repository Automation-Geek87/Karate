package utilities

import com.intuit.karate.gatling.PreDef.{pauseFor, _}
import io.gatling.core.Predef._

import scala.concurrent.duration._

class performance extends Simulation {

// To start mock server through code. Need to remove if starting manually by karate.jar
  MockUtils.startServer()

  val protocol = karateProtocol()

// To execute the list of feature file given
  val custom = scenario("custom").exec(karateFeature("/Users/akhgupta0/Documents/Karate-UI/DCT/src/test/java/feature_files/AP1-Demo.feature"))


// To setup the number of users and gradual degradation time
  setUp(
    custom.inject(rampUsers(10) over (5 seconds)).protocols(protocol)
  )

}


