<br />
<h1 align="center">Joy Dropdowns</h1>

<p align="center">A beautiful package to create controls with properties equivalent to web Dropdown quickly and customizable. <a href="https://lincolnjota.github.io/dropdowns-example/#/">see a live preview</a></p>

# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  joy_dropdowns: ^1.0.0+1
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```
$ pub get
```

with `Flutter`:

```
$ flutter pub get
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import  'package:joy_dropdowns/joy_dropdowns.dart';
```

# Usage
```dart
JoyDropDown(
  overlayHeight:  300,
  overlayWidth:  250,
  overlayOffset:  const  Offset(0, 5),
  overlayPosition:  JoyOverlayPosition.bottom,
  overlayWidget:  Container(
    decoration:  const  BoxDecoration(
      color:  Colors.red,
	),
    child:  SingleChildScrollView(
      physics:  const  ScrollPhysics(),
	  child:  ListView.builder(
          shrinkWrap:  true,
          itemCount:  4,
          itemBuilder: (context, index) {
		    return  InkWell(
		      onTap: () {
		        print('$index');
			  },
              child:  ListTile(
                leading:  const  Icon(Icons.ac_unit),
                title:  Text('Item $index'),
              ),
          );
        },
      ),
    ),
  ),
  child:  ElevatedButton(
    onPressed: () {},
    child:  Text('hover-me'),
   ),
),
```

These are all settings, but it goes from imagination to creating the other overlays.

- `overlayHeight` – This setting is self explanatory, but if it is null, the height will be set by the child of the button.
- `overlayWidth` – Same intention as the previous one. If it is null, the width will be set by the child of the button.
- `overlayOffset` – Maybe you need to move a little bit over there, a little bit over here...
- `overlayPosition` –Where do you have the dropdown appear? That enum can help you. possible are: bottom, left, top, right.
- `overlayWidget` – This is the dropdown widget, you need to put something other than a list, I put open for creativity.
- - `child` – This is the hoverable button widget, it can be anything, a custom container, an ElevatedButton...


## JoyMenu - Fast & Elegant list

If you want to add only one list and be happy,  there is a factory method 
called "JoyDropDown.list", see:

<img src="https://i.imgur.com/U66W1fQ.png" align = "right" height = "300px">

```dart
JoyDropDown.list(
  overlayOffset:  const  Offset(0, 5),
  overlayPosition:  JoyOverlayPosition.bottom,
  menu:  JoyMenu(
    menuDecoration:  BoxDecoration(
      boxShadow: [
        BoxShadow(
          color:  Colors.black.withOpacity(0.5),
          blurRadius:  10,
          spreadRadius:  2,
        ),
      ],
      borderRadius:  BorderRadius.circular(10),
    ),
	hoverColor:  Color.fromARGB(255, 0, 116, 104),
	defaultColor:  Colors.teal,
	items:  items,
   ),
   child: ElevatedButton(
     onPressed: () {},
     child:  Text('hover-me'),
   ),
```

**Note:** It has many settings that can be changed. 
### If you need help, make compliments, donations etc. I'll be online at Discord: JoyGDR#6722.
