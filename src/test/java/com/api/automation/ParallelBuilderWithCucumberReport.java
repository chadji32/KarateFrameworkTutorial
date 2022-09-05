package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import org.apache.commons.io.FileUtils;

public class ParallelBuilderWithCucumberReport {

	@Test
	public void executeKarateTest() {
//		Builder aRunner = new Builder();
//		aRunner.path("classpath:com/api/automation");
//		Results result = aRunner.parallel(5);
//		@Test
//	    void testParallel() {
		Results result = Runner.path("classpath:com/api/automation").outputCucumberJson(true).parallel(5);
		System.out.println("Total Feature => " + result.getFeaturesTotal());
		System.out.println("Total Scenarion => " + result.getScenariosTotal());
		System.out.println("Passed Scenarios => " + result.getScenariosPassed());

		generateCucumberReport(result.getReportDir());
		Assertions.assertEquals(0, result.getFailCount(), "There are Some Failed Scenarios");
	}

	// reportDirLocation -->
	// C:\Users\ChristinaHadjizorzi\eclipse-workspace-ide\karateframework\target\surefire-reports
	public static void generateCucumberReport(String reportDirLocation) {

//		File reportDir = new File(reportDirLocation);
//		Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[] { "json" }, true);
//
//		List<String> jsonFiles = new ArrayList<String>();
//		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
//
//		Configuration configuration = new Configuration(reportDir, "Karate Run");
//		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
//		reportBuilder.generateReports();
		
		Collection<File> jsonFiles = FileUtils.listFiles(new File(reportDirLocation), new String[] {"json"}, true);
    	List<String> jsonPaths = new ArrayList(jsonFiles.size());
    	jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    	Configuration config = new Configuration(new File("target"), "Karate Run");
    	ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
    	reportBuilder.generateReports();

	}

}
