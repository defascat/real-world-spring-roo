// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.defascat.roo.realworld.domain;

import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.defascat.roo.realworld.domain.Server;
import org.defascat.roo.realworld.domain.ServerDataOnDemand;
import org.defascat.roo.realworld.domain.ServerIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ServerIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ServerIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ServerIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ServerIntegrationTest: @Transactional;
    
    @Autowired
    ServerDataOnDemand ServerIntegrationTest.dod;
    
    @Test
    public void ServerIntegrationTest.testCountServers() {
        Assert.assertNotNull("Data on demand for 'Server' failed to initialize correctly", dod.getRandomServer());
        long count = Server.countServers();
        Assert.assertTrue("Counter for 'Server' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ServerIntegrationTest.testFindServer() {
        Server obj = dod.getRandomServer();
        Assert.assertNotNull("Data on demand for 'Server' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Server' failed to provide an identifier", id);
        obj = Server.findServer(id);
        Assert.assertNotNull("Find method for 'Server' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Server' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ServerIntegrationTest.testFindAllServers() {
        Assert.assertNotNull("Data on demand for 'Server' failed to initialize correctly", dod.getRandomServer());
        long count = Server.countServers();
        Assert.assertTrue("Too expensive to perform a find all test for 'Server', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Server> result = Server.findAllServers();
        Assert.assertNotNull("Find all method for 'Server' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Server' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ServerIntegrationTest.testFindServerEntries() {
        Assert.assertNotNull("Data on demand for 'Server' failed to initialize correctly", dod.getRandomServer());
        long count = Server.countServers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Server> result = Server.findServerEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Server' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Server' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ServerIntegrationTest.testFlush() {
        Server obj = dod.getRandomServer();
        Assert.assertNotNull("Data on demand for 'Server' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Server' failed to provide an identifier", id);
        obj = Server.findServer(id);
        Assert.assertNotNull("Find method for 'Server' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyServer(obj);
        Integer currentVersion = obj.getVersion_();
        obj.flush();
        Assert.assertTrue("Version for 'Server' failed to increment on flush directive", (currentVersion != null && obj.getVersion_() > currentVersion) || !modified);
    }
    
    @Test
    public void ServerIntegrationTest.testMergeUpdate() {
        Server obj = dod.getRandomServer();
        Assert.assertNotNull("Data on demand for 'Server' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Server' failed to provide an identifier", id);
        obj = Server.findServer(id);
        boolean modified =  dod.modifyServer(obj);
        Integer currentVersion = obj.getVersion_();
        Server merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Server' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion_() > currentVersion) || !modified);
    }
    
    @Test
    public void ServerIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Server' failed to initialize correctly", dod.getRandomServer());
        Server obj = dod.getNewTransientServer(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Server' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Server' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Server' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ServerIntegrationTest.testRemove() {
        Server obj = dod.getRandomServer();
        Assert.assertNotNull("Data on demand for 'Server' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Server' failed to provide an identifier", id);
        obj = Server.findServer(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Server' with identifier '" + id + "'", Server.findServer(id));
    }
    
}
