// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.defascat.roo.realworld.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import org.defascat.roo.realworld.domain.Server;

privileged aspect Server_Roo_Jpa_Entity {
    
    declare @type: Server: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Server.id;
    
    @Version
    @Column(name = "version_")
    private Integer Server.version_;
    
    public Long Server.getId() {
        return this.id;
    }
    
    public void Server.setId(Long id) {
        this.id = id;
    }
    
    public Integer Server.getVersion_() {
        return this.version_;
    }
    
    public void Server.setVersion_(Integer version) {
        this.version_ = version;
    }
    
}