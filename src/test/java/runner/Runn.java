
package runner;

import static org.junit.Assert.*;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.junit.Test;
import com.intuit.karate.cucumber.CucumberRunner;
import cucumber.api.CucumberOptions;
import com.intuit.karate.cucumber.KarateStats;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import utilities.MockUtils;
import org.apache.commons.io.FileUtils;



// To provide cucumber options with feature file list and specific tags to execute
@CucumberOptions(features = {"src/test/java/feature_files_ui/"} ,tags = {"@Google"}
	)
public class Runn {

	@Test 
	public void testParallel() throws Exception 
	{
//		MockUtils.startServer();
		String karateOutputPath = "target/surefire-reports";
		KarateStats stats1 = CucumberRunner.parallel(getClass(), 2, karateOutputPath);
		
		// To generate report from json file created by parallel runner in surefire reports
         generateReport(karateOutputPath);
         assertTrue("there are scenario failures", stats1.getFailCount() == 0);        
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