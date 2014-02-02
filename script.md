Today I'm going to be talking to you about declarative programming as it relates to user interfaces, the QML language which implements these declarative ideas and my own project HQML which sits on top of QML.

So first, what is declarative programming? The very short answer is that it is telling your machine what you want, not what to do. This can be contrasted directly to imperative programming, in which you must guide the computer through each step to achieve your goals.
Instead you state the goals of your program and allow the runtime / framework / library reason about the best way to achieve them.
This is useful in a number of domains - some of which you will have certainly used before, such as SQL - but today I'll be talking about a domain where I believe it's not only useful but a required part of your toolkit: user interfaces.

Let's start with an extremely simple example to highlight the differences between the declarative and imperative approach.
The requirements for our program are simple - we need a block level element containing two inline elements which have the words 'hello' and 'world' in them respectively, separated by a space.
Here are two approaches that achieve the spec, one simply says what we want, the other goes into quite a bit of detail as to how to create our document tree.
Even though it's unlikely you'd ever write code like this in real life, let's go over the comparative benefits of the declarative version as we'll soon see they apply across the board in a more real world example.

The first benefit is quite simple - the HTML is a lot more to the point. There's a lot more room to introduce bugs due to the verbosity of the imperative code, and the fact it's doing more work - for example retaining a bunch of references to the divs and spans before constructing the tree.
Related to that is the time both to create the interface and iterate changes. When it comes time to update the interface and change something I know which code I'd rather be presented with.
One of the nicest features of declarative code is that it's quite simple to determine the intent with which it was written. In fact if you read that HTML snippet out loud you'll basically get back the spec I gave to you. For the imperative code you basically have to step through it in your head to see what its doing, which doesn't tend to scale very well. When you really get into declarative programming you'll start to notice it's a lot less context dependent than imperative code, which helps on this point as well.

(no slide) Hopefully at this point you're thinking that there's no way you'd write JavaScript like in this example, that it's obviously inferior and I'm just wasting your time treading over the benefits of HTML over JavaScript for simple UIs. But I've written code as bad as this, every web developer I've worked with has written code like this, and I'd be willing to bet anyone in this room who's built a UI has written code like this. In the web world in particular it's not immediately obvious that there's a better way too. So let's get straight to an example that shows what I mean.

You can see here we've got a simple sign up form, the only prerequisite is that you accept the terms and conditions to be allowed in. If you don't, the server's simply going to re-serve the page, maybe with a little error box. To improve the user experience, your boss / client / whoever says that the button should not be clickable while the checkbox is empty.

