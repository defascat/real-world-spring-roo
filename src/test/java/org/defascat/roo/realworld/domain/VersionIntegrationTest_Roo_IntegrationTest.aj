// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.defascat.roo.realworld.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.defascat.roo.realworld.domain.Version;
import org.defascat.roo.realworld.domain.VersionDataOnDemand;
import org.defascat.roo.realworld.domain.VersionIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VersionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: VersionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: VersionIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: VersionIntegrationTest: @Transactional;
    
    @Autowired
    VersionDataOnDemand VersionIntegrationTest.dod;
    
    @Test
    public void VersionIntegrationTest.testCountVersions() {
        Assert.assertNotNull("Data on demand for 'Version' failed to initialize correctly", dod.getRandomVersion());
        long count = Version.countVersions();
        Assert.assertTrue("Counter for 'Version' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void VersionIntegrationTest.testFindVersion() {
        Version obj = dod.getRandomVersion();
        Assert.assertNotNull("Data on demand for 'Version' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Version' failed to provide an identifier", id);
        obj = Version.findVersion(id);
        Assert.assertNotNull("Find method for 'Version' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Version' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void VersionIntegrationTest.testFindAllVersions() {
        Assert.assertNotNull("Data on demand for 'Version' failed to initialize correctly", dod.getRandomVersion());
        long count = Version.countVersions();
        Assert.assertTrue("Too expensive to perform a find all test for 'Version', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Version> result = Version.findAllVersions();
        Assert.assertNotNull("Find all method for 'Version' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Version' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void VersionIntegrationTest.testFindVersionEntries() {
        Assert.assertNotNull("Data on demand for 'Version' failed to initialize correctly", dod.getRandomVersion());
        long count = Version.countVersions();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Version> result = Version.findVersionEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Version' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Version' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void VersionIntegrationTest.testFlush() {
        Version obj = dod.getRandomVersion();
        Assert.assertNotNull("Data on demand for 'Version' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Version' failed to provide an identifier", id);
        obj = Version.findVersion(id);
        Assert.assertNotNull("Find method for 'Version' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyVersion(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Version' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VersionIntegrationTest.testMergeUpdate() {
        Version obj = dod.getRandomVersion();
        Assert.assertNotNull("Data on demand for 'Version' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Version' failed to provide an identifier", id);
        obj = Version.findVersion(id);
        boolean modified =  dod.modifyVersion(obj);
        Integer currentVersion = obj.getVersion();
        Version merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Version' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VersionIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Version' failed to initialize correctly", dod.getRandomVersion());
        Version obj = dod.getNewTransientVersion(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Version' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Version' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Version' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void VersionIntegrationTest.testRemove() {
        Version obj = dod.getRandomVersion();
        Assert.assertNotNull("Data on demand for 'Version' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Version' failed to provide an identifier", id);
        obj = Version.findVersion(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Version' with identifier '" + id + "'", Version.findVersion(id));
    }
    
}
