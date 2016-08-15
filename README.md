##Facebook login:
URL: https://developers.facebook.com/apps
You can create a test app that's connected to your main app. On the Dashboard or Settings page for your main app. scroll down and you'll see "Test Apps" in the menu that runs down the left side of the page. The test app will inherit settings from the main app, but it will permanently be in development mode, and it will have its own ID.

In the Initializers directory there is a file ie omniouth.rb. You need to specify all the social keys there. Make sure have restarted the application after making any change in that file.

1.) In the center under the first box of options, click "+ Add Platform" and choose "Website" (or whatever is appropriate for your app.)

2.) In the box that comes up for the website you just added: Site URL: http://localhost:3000/

3.) In the box above that (Settings => Basic): App Domain:  localhost

4.) At the bottom right - click "Save Changes"

5.) Make sure you have the app ID copied and pasted correctly into your code. (The ID is in the first box on that page if you need it again.)


