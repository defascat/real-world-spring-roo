package org.defascat.roo.realworld.web;
import org.defascat.roo.realworld.domain.Version;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/versions")
@Controller
@RooWebScaffold(path = "versions", formBackingObject = Version.class)
public class VersionController {
}
