# aem-twitter-integration

A sample AEM to twitter integration.  Initially provides AEM components that wrap Twitter web widgets. Support for:

Tweet - Allows the user to tweet with a link to the current page (or the URL you specify in the component)

Follow - Click button to follow the Twitter account specified in the component.

Mention - Allows the user to tweet at the account you specify in the component.

Timeline - Display a Twitter timeline.  Requires a Twitter widget be created using Twitter tooling.  The Twitter
widget ID is specified in the component.

Grid - Display a Twitter collection as a grid.  Requires creating a Twitter collection and publishing it using Twitter
tooling.  The collection ID is specified in the component.

All components are available as JSP, SCF, and Sightly implementations.

Feel free to fork and modify as desired, or contribute back using pull requests.

To install, clone the repo and run:

mvn clean install

Then deploy the package created in /content/target to AEM.  Components are installed to /apps/twitter-integration.
