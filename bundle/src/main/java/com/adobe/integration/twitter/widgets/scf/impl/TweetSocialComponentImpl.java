package com.adobe.integration.twitter.widgets.scf.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;

import com.adobe.cq.social.scf.ClientUtilities;
import com.adobe.cq.social.scf.core.BaseSocialComponent;

public class TweetSocialComponentImpl extends BaseSocialComponent {
    private final ValueMap props;

    public TweetSocialComponentImpl(Resource resource, ClientUtilities clientUtils) {
        super(resource, clientUtils);
        props = resource.getValueMap();
    }

    public String getText() {
        return props.get("text", String.class);
    }

    public String getShareUrl() {
        return props.get("shareUrl", String.class);
    }

    public String getVia() {
        return props.get("via", String.class);
    }

    public String getRecommend() {
        return props.get("recommend", String.class);
    }

    public String getHashTags() {
        String hashTags = null;
        String[] hashTagsArr = props.get("hashtags", String[].class);
        if (hashTagsArr != null && hashTagsArr.length > 0) {
            hashTags = StringUtils.join(hashTagsArr, ",");
        }
        return hashTags;
    }

    public boolean getLargeButton() {
        return props.get("largeButton", Boolean.FALSE);
    }

    public boolean getTailorTwitter() {
        return props.get("tailorTwitter", Boolean.FALSE);
    }

    @Override
    protected List<String> getIgnoredProperties() {
        this.ignoredProperties.add("text");
        this.ignoredProperties.add("shareUrl");
        this.ignoredProperties.add("via");
        this.ignoredProperties.add("recommend");
        this.ignoredProperties.add("hashtags");
        this.ignoredProperties.add("largeButton");
        this.ignoredProperties.add("tailorTwitter");
        return super.getIgnoredProperties();
    }
}
