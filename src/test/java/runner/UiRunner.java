
package runner;

import com.intuit.karate.cucumber.CucumberRunner;
import com.intuit.karate.cucumber.KarateStats;
import cucumber.api.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import static org.junit.Assert.assertTrue;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;



// To provide cucumber options with feature file list and specific tags to execute
@CucumberOptions(features = "src/test/java/feature_files_ui/" )
public class UiRunner {

	@Test 
	public void testParallel() throws Exception 
	{
	    String path="src/test/java/feature_files_ui/";

	    Results results = Runner.path(path).tags("GCA").parallel(3);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);


		//MockUtils.startServer();
		String karateOutputPath = "target/surefire-reports";

		//KarateStats stats1 = CucumberRunner.parallel(getClass(), 3, karateOutputPath);

         // To generate report from json file created by parallel runner in surefire reports

         generateReport(karateOutputPath);
         assertTrue("there are scenario failures", results.getFailCount() == 0);
     }


	
	
////////////////////// METHOD TO GENERATE REPORT WITH ABSOLUTE PATH //////////////////////////////////////

     private static void generateReport(String karateOutputPath) {
         Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
         List<String> jsonPaths = new ArrayList(jsonFiles.size());
         for (File file : jsonFiles) 
         {
             jsonPaths.add(file.getAbsolutePath());
         }
         Configuration config = new Configuration(new File("target"), "DCT");
         ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
         reportBuilder.generateReports();  
	}

}