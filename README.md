
# Circle Bottom Bar

![](doc/animation.gif)

## Example style:

<table>
    <thead>
        <tr>
            <th><strong>no padding black</strong></th>
            <th><strong>padding with gradient</strong></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/nopadding-black.png" alt=""></td>
            <td><img src="https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/padding-gradient2.png" alt=""></td>
        </tr>
    </tbody>
</table>


## How to use
```yaml
dependencies:
  circle_nav_bar: ^latest_version
```

```dart
import 'package:circle_nav_bar/circle_nav_bar.dart';

Scaffold(
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.person, color: Colors.deepPurple),
          Icon(Icons.home, color: Colors.deepPurple),
          Icon(Icons.favorite, color: Colors.deepPurple),
        ],
        inactiveIcons: const [
          Text("My"),
          Text("Home"),
          Text("Like"),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        initIndex: 1,
        onChanged: (v) {
          // TODO
        },
        // tabCurve: ,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.deepPurple,
        elevation: 10,
      ),
      ...
```

![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value.png)