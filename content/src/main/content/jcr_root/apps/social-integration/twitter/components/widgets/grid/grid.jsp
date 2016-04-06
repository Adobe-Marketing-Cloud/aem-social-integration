<%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false"
          import="com.adobe.granite.ui.components.AttrBuilder,
        com.day.cq.i18n.I18n,
        org.apache.commons.lang3.StringUtils" %><%
%><%
    I18n i18n = new I18n(slingRequest);
    AttrBuilder attrs = new AttrBuilder(request, xssAPI);

    String user = properties.get("user", "ChangeMe");
    String collectionID = properties.get("collection", String.class);
    int limit = properties.get("limit", 0);
    boolean tailorTwitter = properties.get("tailorTwitter", Boolean.FALSE);

    String href = null;

    if (StringUtils.isNotBlank(collectionID)) {
        attrs.addOther("widget-id", collectionID);
        href = "https://twitter.com/" + user + "/timelines/" + collectionID;
    } else {
        href = "http://twitter.com/" + user;
    }

    attrs.addHref("href", href);
    attrs.addClass("twitter-grid");

    if (limit > 0) {
        String limitStr = Integer.toString(limit);
        attrs.addOther("limit", limitStr);
    }

    if (tailorTwitter) {
        attrs.addOther("dnt", "true");
    }

%>
<cq:includeClientLib categories="aem.integrations.twitter" />
<a <%= attrs.build() %>><%= i18n.get("Twitter grid") %></a>
