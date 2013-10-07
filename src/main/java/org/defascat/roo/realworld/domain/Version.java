package org.defascat.roo.realworld.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class Version {

    /**
     */
    @NotNull
    @Column(unique = true)
    private String name;
}
