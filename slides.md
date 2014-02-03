# Declarative User Interface Programming

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

---
## Best of all

UI synchronisation and state is managed

Complex projects become much easier to maintain and extend

---
## Imperative

```html
<div>
  <label><input type="radio" name="plan" value="hobbyist" checked="checked"> Hobbyist</label>
  <label><input type="radio" name="plan" value="enterprise"> Enterprise</label>
</div>
```

```javascript
$('#signup').prop('disabled', !$('#tandc').prop('checked'));

$(function() {
  $('#tandc').on('change', function() {
    $('#signup').prop('disabled', !$(this).prop('checked'));
  });

  $('input[name="plan"]').on('change', function() {
    $('#tandc').prop('checked', false);
  });
});
```

---
## Declarative

```html
<div data-bind="event: { change: function() { termsAccepted(false); } }">
  <label><input type="radio" name="plan" value="hobbyist" checked="checked"> Hobbyist</label>
  <label><input type="radio" name="plan" value="enterprise"> Enterprise</label>
</div>
```
```html
<div>
  <label><input type="checkbox" name="tandc" data-bind="checked: termsAccepted"> Accept Terms and Conditions</label>
</div>
<button type="submit" name="signup" data-bind="enable: termsAccepted">Sign up!</button>
```

---
## QML

<Provides both a runtime and a library of components

<Declarative markup looks like a mix of CSS and JavaScript

<Object nesting is like JSON

<Separates concerns by components, not appearance / behaviour

<When you need imperative, it's just JavaScript

---
## Our example program

```javascript
import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Window 2.0

ApplicationWindow {
  title: "Sign up!"
  width: 400
  height: width * 0.75

  Column {
    ExclusiveGroup {
      id: plans
      onCurrentChanged: terms.checked = false
    }
    RadioButton {
      exclusiveGroup: plans
      text: "Hobbyist"
    }
    RadioButton {
      exclusiveGroup: plans
      text: "Enterprise"
    }
    CheckBox {
      id: terms
      text: "Accept Terms and Conditions"
    }
    Button {
      text: "Sign up!"
      enabled: terms.checked
    }
  }
}
```

---
## QML Modules

QtQuick (basic types)

Visual

User Input

Positioning

Controls

State, Transition, Animation

Model/View

Data Storage

Shaders

Canvas

---
## Components and Bindings

#### ProfitText.qml

```javascript
Text {
  color: {
    return parseFloat(text) < 0 ? 'red' : 'black';
  }
}
```

---
## Signals and Custom Properties

```javascript
MouseArea {
  property string myProp: "hello"

  onClicked: {
    console.log("My custom property says: " + myProp);
  }
}
```

---
## External JavaScript

#### myapp.js

```javascript
function doSomethingCool() {
  console.log('Radical!');
}
```

#### myapp.qml

```javascript
import "myapp.js" as App

MouseArea {
  onClicked: App.doSomethingCool
}
```

---
## My Project - HQML

<Bringing QML to your browser

<Feature support: property binding, automatic dependencies, signals, external JS, scope resolution

<Object support: visual item types, mouse input, anchor and grid based layout

<TODO: lots :(