package com.adobe.integration.twitter.widgets.scf.impl;


import java.util.List;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;

import com.adobe.cq.social.scf.ClientUtilities;
import com.adobe.cq.social.scf.core.BaseSocialComponent;

public class FollowSocialComponentImpl extends BaseSocialComponent {
    private final ValueMap props;

    public FollowSocialComponentImpl(Resource resource, ClientUtilities clientUtils) {
        super(resource, clientUtils);
        props = resource.getValueMap();
    }

    public String getUser() {
        return props.get("user", "ChangeMe");
    }

    public boolean getShowUser() {
        return props.get("showUser", Boolean.FALSE);
    }

    public boolean getShowCount() {
        return props.get("showCount", Boolean.FALSE);
    }

    public boolean getLargeButton() {
        return props.get("largeButton", Boolean.FALSE);
    }

    public boolean getTailorTwitter() {
        return props.get("tailorTwitter", Boolean.FALSE);
    }

    @Override
    protected List<String> getIgnoredProperties() {
        this.ignoredProperties.add("user");
        this.ignoredProperties.add("showUser");
        this.ignoredProperties.add("showCount");
        this.ignoredProperties.add("largeButton");
        this.ignoredProperties.add("tailorTwitter");
        return super.getIgnoredProperties();
    }
}
