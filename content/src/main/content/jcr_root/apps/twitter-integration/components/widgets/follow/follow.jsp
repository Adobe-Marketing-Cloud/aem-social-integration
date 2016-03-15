<%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false"
        import="com.adobe.granite.ui.components.AttrBuilder,
        com.day.cq.i18n.I18n" %><%
%><%
    I18n i18n = new I18n(slingRequest);
    AttrBuilder attrs = new AttrBuilder(request, xssAPI);

    String user = properties.get("user", "ChangeMe");
    boolean showUser = properties.get("showUser", Boolean.FALSE);
    boolean showCount = properties.get("showCount", Boolean.FALSE);
    boolean largeButton = properties.get("largeButton", Boolean.FALSE);
    boolean tailorTwitter = properties.get("tailorTwitter", Boolean.FALSE);

    attrs.addHref("href", "https://twitter.com/" + user);
    attrs.addClass("twitter-follow-button");
    if (showCount) {
        attrs.addOther("show-count", "true");
    } else {
        attrs.addOther("show-count", "false");
    }
    if (!showUser) {
        attrs.addOther("show-screen-name", "false");
    }
    if (largeButton) {
        attrs.addOther("size", "large");
    }
    if (tailorTwitter) {
        attrs.addOther("dnt", "true");
    }

%>

<cq:includeClientLib categories="aem.integrations.twitter" />
<a <%= attrs.build() %>><%=i18n.get("Follow") + "@" + user %></a>

