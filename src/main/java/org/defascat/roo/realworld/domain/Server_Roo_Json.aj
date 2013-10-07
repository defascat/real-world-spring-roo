// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.defascat.roo.realworld.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.defascat.roo.realworld.domain.Server;

privileged aspect Server_Roo_Json {
    
    public String Server.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String Server.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static Server Server.fromJsonToServer(String json) {
        return new JSONDeserializer<Server>().use(null, Server.class).deserialize(json);
    }
    
    public static String Server.toJsonArray(Collection<Server> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String Server.toJsonArray(Collection<Server> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Server> Server.fromJsonArrayToServers(String json) {
        return new JSONDeserializer<List<Server>>().use(null, ArrayList.class).use("values", Server.class).deserialize(json);
    }
    
}