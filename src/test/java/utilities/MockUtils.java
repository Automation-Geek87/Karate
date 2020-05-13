package utilities;

import com.intuit.karate.FileUtils;
import com.intuit.karate.netty.FeatureServer;

import java.io.File;

public class MockUtils {
    
    public static void  startServer() {
    	
//To get the mock file relative to another file
    	File file = FileUtils.getFileRelativeTo(MockUtils.class, "/Users/akhgupta0/Documents/Karate-UI/DCT/src/test/java/feature_files/AP1-Demo.feature");
//To start server with filename and port number    	
        FeatureServer server = FeatureServer.start(file, 0, false, null);
//To set the property of randomly generated url in user defined variable 
        //System.setProperty("mock.CDCWithdrawal.url", "http://localhost:" + server.getPort());  
        System.setProperty("mock.purchase.url", "http://localhost:" + server.getPort());  
        
        
    }
    
}
