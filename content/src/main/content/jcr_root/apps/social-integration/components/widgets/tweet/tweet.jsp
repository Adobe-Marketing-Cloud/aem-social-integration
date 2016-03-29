<%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false"
        import="com.adobe.granite.ui.components.AttrBuilder,
                com.day.cq.i18n.I18n,
                org.apache.commons.lang3.StringUtils" %><%
%><%
    I18n i18n = new I18n(slingRequest);
    AttrBuilder attrs = new AttrBuilder(request, xssAPI);

    String text = properties.get("text", String.class);
    String shareUrl = properties.get("shareUrl", String.class);
    String via = properties.get("via", String.class);
    String recommend = properties.get("recommend", String.class);
    String[] hashtagsArr = properties.get("hashtags", String[].class);
    boolean largeButton = properties.get("largeButton", Boolean.FALSE);
    boolean tailorTwitter = properties.get("tailorTwitter", Boolean.FALSE);

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
<a <%= attrs.build() %>><%= i18n.get("Tweet")%></a>

