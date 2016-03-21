package com.adobe.integration.twitter.widgets.scf.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.jackrabbit.util.Text;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;

import com.adobe.cq.social.scf.ClientUtilities;
import com.adobe.cq.social.scf.core.BaseSocialComponent;

public class MentionSocialComponentImpl extends BaseSocialComponent {
    private final ValueMap props;

    public MentionSocialComponentImpl(Resource resource, ClientUtilities clientUtils) {
        super(resource, clientUtils);
        props = resource.getValueMap();
    }

    public String getUser() {
        return props.get("user", "ChangeMe");
    }

    public String getQuery() {
        String text = props.get("text", String.class);
        if (StringUtils.isNotBlank(text)) {
            return "text=" + Text.escape(text);
        }
        return null;
    }

    public String getRecommend() {
        String[] recommendArr = props.get("recommend", String[].class);
        if (recommendArr != null && recommendArr.length > 0) {
            return StringUtils.join(recommendArr, ",");
        }
        return null;
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
        this.ignoredProperties.add("largeButton");
        this.ignoredProperties.add("tailorTwitter");
        return super.getIgnoredProperties();
    }
}
