<%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false"
        import="com.adobe.granite.ui.components.AttrBuilder,
        com.day.cq.i18n.I18n,
        org.apache.commons.lang3.StringUtils,
        org.apache.jackrabbit.util.Text" %><%
%><%
    I18n i18n = new I18n(slingRequest);
    AttrBuilder attrs = new AttrBuilder(request, xssAPI);

    String user = properties.get("user", "ChangeMe");
    String defaultText = properties.get("text", String.class);
    String[] recommendArr = properties.get("recommend", String[].class);
    boolean largeButton = properties.get("largeButton", Boolean.FALSE);
    boolean tailorTwitter = properties.get("tailorTwitter", Boolean.FALSE);

    String href = "https://twitter.com/intent/tweet?screen_name=" + user;
    if (StringUtils.isNotBlank(defaultText)) {
        href = href + "&text=" + Text.escape(defaultText);
    }

    attrs.addHref("href", href);
    attrs.addClass("twitter-mention-button");
    if (recommendArr != null && recommendArr.length > 0) {
        attrs.addOther("related", StringUtils.join(recommendArr, ","));
    }
    if (largeButton) {
        attrs.addOther("size", "large");
    }
    if (tailorTwitter) {
        attrs.addOther("dnt", "true");
    }

%>

<cq:includeClientLib categories="aem.integrations.twitter" />
<a <%= attrs.build() %>><%=i18n.get("Tweet to") + " @" + user %></a>

