package com.adobe.integration.twitter.widgets.scf.impl;


import java.util.List;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;

import com.adobe.cq.social.scf.ClientUtilities;
import com.adobe.cq.social.scf.core.BaseSocialComponent;

public class GridSocialComponentImpl extends BaseSocialComponent {
    private final ValueMap props;

    public GridSocialComponentImpl(Resource resource, ClientUtilities clientUtils) {
        super(resource, clientUtils);
        props = resource.getValueMap();
    }

    public String getUser() {
        return props.get("user", "ChangeMe");
    }

    public String getCollection() {
        return props.get("collection", String.class);
    }

    public int getLimit() {
        return props.get("limit", 0);
    }

    public boolean getTailorTwitter() {
        return props.get("tailorTwitter", Boolean.FALSE);
    }

    @Override
    protected List<String> getIgnoredProperties() {
        this.ignoredProperties.add("user");
        this.ignoredProperties.add("collection");
        this.ignoredProperties.add("limit");
        this.ignoredProperties.add("tailorTwitter");
        return super.getIgnoredProperties();
    }
}
