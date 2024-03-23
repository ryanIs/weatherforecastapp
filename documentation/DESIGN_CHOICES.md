# Design Choices - Ryan Isler

## Primary Objective

My primary objective with this application (any software application really) is
to encapsulate, encapsulate, encapsulate! If the code dictates it, I like to 
create separate files/folders for components so that we may perform the 
following actions on them in the future:

<ul>
  <li>Scale the component(s) as needed.</li>
  <li>Perform tests and updates in an isolated environment.</li>
  <li>Maintain separation of concerns and more easily meld with git.</li>
  <li>Better piece of mind to work on something small, rather than a large file.</li>
</ul>

## Action Items

My action items when I first sat down and began working on this awesome project 
was to:

<ul>
  <li>Develop with a data first mindset: I prefer to have my data (JSON, XML, 
  DB table returns, etc.) shape the way I develop the rest of the stack 
  (taking into account designs and requests from the top-level of course). 
  From there, I have a clear, structured path forward (e.g. oh - the JSON 
  provided from their 3rd party API is structured <i>this</i> way, so that
  means: we have to optimize our front-end/server-side code <i>this</i> way. 
  Things of this nature. With this approach, I can easily work with other 
  developers to make components and other applications or frameworks on top 
  of this solid structure.</li>
  <li>After I brought in the data from tomorrow.io, I began building the 
  Flutter widgets to accommodate the data (having the reference images helped). 
  I like to approach applications <b>MVP</b> (<i>minimum viable product</i>) or PVP 
  (<i>(minimum) personally viable product</i>) first. After that has been created, 
  we can build upon what we have and improve. Just get something 'physical' 
  into the world first (this helps avoid the potential infinite design phase).
  </li>
  <li>From there, the application may be built out to spec and polished as 
  needed. Handle any small bugs or style adjustments as needed. Do another 
  round on the documentation to make not only the front-end pretty, but 
  the code as well (don't leave our coding brothers behind!).</li>
</ul>

## Challenges Faced

Here are some of the challenges I faced during development of this application:

<ul>
  <li>Ensuring I properly handled null values from the 3rd party JSON response.
  Dart puts heavy emphasis on proper null-safety, so it was important that I 
  made the code properly manage blank `doubles`, `strings`, and other values.</li>
  <li>There was a TON of available data. A challenge I faced was choosing the 
  best path forward when designing the code and the front-end look-and-feel. I 
  wanted to keep it simple while also being able to display a lot of useful data. 
  Finding that middle ground in software development (especially in the weather 
  service field) can be challenging!</li>
  <li>Better usage and know-how with the `late`, `final` and `?` keywords. I feel like 
  it is easy to get trapped in a pattern of over-using these keywords. 
  Sometimes getting a (stuck) feature to work quickly doesn't mean it works 
  optimally (on the Dart/Flutter end of things).</li>
  <li>While I like the ending design and functionality of the site - there 
  is definitely room for improvement! I used only the basic styling Flutter 
  widgets. There are many awesome tools that Flutter has to really spice up 
  the application in terms of design!</li>
  <li>I had a lot of fun building out the widgets and UI! Very easy to 
  utilize this framework to build some awesome applications!</li>
</ul>