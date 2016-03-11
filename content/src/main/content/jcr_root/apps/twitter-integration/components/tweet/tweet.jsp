<%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false"
        import="com.adobe.granite.ui.components.AttrBuilder,
                com.adobe.granite.ui.components.Config,
                com.adobe.granite.ui.components.Tag,
                org.apache.commons.lang.StringUtils" %><%
%><%
    Config cfg = cmp.getConfig();
    Tag tag = cmp.consumeTag();
    AttrBuilder attrs = tag.getAttrs();

    String text = cfg.get("text", String.class);
    String shareUrl = cfg.get("shareUrl", String.class);
    String via = cfg.get("via", String.class);
    String recommend = cfg.get("recommend", String.class);
    String[] hashtagsArr = cfg.get("hashtags", String[].class);
    boolean largeButton = cfg.get("largeButton", Boolean.TRUE);
    boolean tailorTwitter = cfg.get("tailorTwitter", Boolean.TRUE);

    attrs.addHref("href", "https://twitter.com/share");
    attrs.addClass("twitter-share-button");
    if (StringUtils.isNotBlank(text)) {
        attrs.addOther("text", text);
    }
    if (StringUtils.isNotBlank(shareUrl)) {
        attrs.addOther("url", shareUrl);
    }
    if (StringUtils.isNotBlank(via)) {
        attrs.addOther("via", via);
    }
    if (largeButton) {
        attrs.addOther("size", "large");
    }
    if (StringUtils.isNotBlank(recommend)) {
        attrs.addOther("related", recommend);
    }
    if (tailorTwitter) {
        attrs.addOther("dnt", "true");
    }
    if (hashtagsArr != null && hashtagsArr.length > 0) {
        attrs.addOther("hashtags", StringUtils.join(hashtagsArr, ","));
    }
%>
<cq:includeClientLib categories="aem.integrations.twitter" />
<a <%= attrs.build() %>>Tweet</a>

