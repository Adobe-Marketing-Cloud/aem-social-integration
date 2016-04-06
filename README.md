# aem-social-integration

A sample AEM to social integration.  Provides AEM components that wrap Twitter and Facebook web widgets. Twitter support for:

Tweet - Allows the user to tweet with a link to the current page (or the URL you specify in the component)

Follow - Click button to follow the Twitter account specified in the component.

Mention - Allows the user to tweet at the account you specify in the component.

Timeline - Display a Twitter timeline.  Requires a Twitter widget be created using Twitter tooling.  The Twitter
widget ID is specified in the component.

Grid - Display a Twitter collection as a grid.  Requires creating a Twitter collection and publishing it using Twitter
tooling.  The collection ID is specified in the component.

All components are available as JSP, SCF, and Sightly implementations.

Facebook support for:

Like - Like a specified URL.

Share - Publicly share a URL.
 
Send - Privately send a URL to one or more friends.

Follow - Followed the specified user.

Post - Embed a Facebook post.

Video - Embed a Facebook video.

Page - Embed a Facebook page.

Feel free to fork and modify as desired, or contribute back using pull requests.

See issues page for known issues.

To install, clone the repo and run:

mvn clean install

Then deploy the package created in /content/target to AEM.  Components are installed to /apps/social-integration.
