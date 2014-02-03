## Declarative User Interface Programming

### and (H)QML

<hr>
Matthew Cook

CodeCraft Dunedin

---
## What is Declarative Programming?

<Tell your machine what you want to achieve

<But not _how_ you want it done

<Opposite of **Imperative Programming**

<Very abstract - let your runtime/framework reason about how to implement

---
## A silly example

#### Declarative

```html
<div><span>Hello</span> <span>world</span></div>
```

#### Imperative

```javascript
var myDiv = document.createElement('div');

var helloSpan = document.createElement('span');
helloSpan.appendChild(document.createTextNode('Hello'));

var worldSpan = document.createElement('span');
worldSpan.appendChild(document.createTextNode('world'));

myDiv.appendChild(helloSpan);
myDiv.appendChild(document.createTextNode(' '));
myDiv.appendChild(worldSpan);

document.body.appendChild(myDiv);
```

---
## Declarative Benefits

<Fewer keystrokes - less chance for mistakes

<Faster iteration

<Clarity of purpose

<UI state is managed - stays 'in sync'

---
## Real world example

#### The setup

```html
<form>
  <div>
    <label><input type="checkbox" name="tandc"> Accept Terms and Conditions</label>
  </div>
  <button type="submit" name="signup">Sign up!</button>
</form>
```

---
## Imperative Implementation

```html
<form>
  <div>
    <label><input type="checkbox" name="tandc" id="tandc"> Accept Terms and Conditions</label>
  </div>
  <button type="submit" name="signup" id="signup">Sign up!</button>
</form>
```

```javascript
$(function() {
  $('#signup').prop('disabled', !$('#tandc').prop('checked'));

  $('#tandc').on('change', function() {
    $('#signup').prop('disabled', !$(this).prop('checked'));
  });
});
```

---
## Fantasy Implementation

```html
<form>
  <div>
    <label><input type="checkbox" name="tandc" id="tandc"> Accept Terms and Conditions</label>
  </div>
  <button type="submit" name="signup" disabled="!tandc.checked">Sign up!</button>
</form>
```

---
## Declarative Implementation

```html
<form>
  <div>
    <label><input type="checkbox" name="tandc" data-bind="checked: termsAccepted"> Accept Terms and Conditions</label>
  </div>
  <button type="submit" name="signup" data-bind="enable: termsAccepted">Sign up!</button>
</form>
```

```javascript
viewModel = {
  termsAccepted: ko.observable(false)
};

ko.applyBindings(viewModel);
```
