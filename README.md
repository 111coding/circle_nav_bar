# Circle Nav Bar

![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/animation.gif)

## Example style:

- `./example`
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

- `./example_two`
<table>
    <thead>
        <tr>
            <th><strong>Level and Icons</strong></th>
            <th><strong>only Icons </strong></th>
            <th><strong>padding with Levels and icons</strong></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img src="https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/bottom-nev-with-levels.png" alt=""></td>
            <td><img src="https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/bottom-nev.png" alt=""></td>
            <td><img src="https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/floating-bottom-navbar.png" alt=""></td>
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
        circleColor: Colors.white,
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
        circleShadowColor: Colors.deepPurple,
        elevation: 10,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [ Colors.blue, Colors.red ],
        ),
        circleGradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [ Colors.blue, Colors.red ],
        ),
      ),
      ...
```

![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value.png)

![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/value-05.png)

![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/bottom-nev-with-levels.png)

![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/bottom-nev.png)

![](https://raw.githubusercontent.com/111coding/circle_nav_bar/master/doc/floating-bottom-navbar.png)

## Contributors

<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/111coding"><img src="https://avatars.githubusercontent.com/u/49793527?v=4?s=100" width="100px;" alt="Jiwon Lee"/><br /><sub><b>Jiwon Lee</b></sub></a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/rupinderjeet"><img src="https://avatars.githubusercontent.com/u/14011726?v=4?s=100" width="100px;" alt="Rupinderjeet Singh Hans"/><br /><sub><b>Rupinderjeet Singh Hans</b></sub></a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/MdAshrafUllah"><img src="https://avatars.githubusercontent.com/u/96839511?v=4?s=100" width="100px;" alt="Md Ashraf Ullah"/><br /><sub><b>Md Ashraf Ullah</b></sub></a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/mark-kkk"><img src="https://avatars.githubusercontent.com/u/107383286?v=4?s=100" width="100px;" alt="mark-kkk"/><br /><sub><b>mark-kkk</b></sub></a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/kzrnm"><img src="https://avatars.githubusercontent.com/u/32071278?v=4s=100" width="100px;" alt="kzrnm"/><br /><sub><b>kzrnm</b></sub></a></td>
    </tr>
  </tbody>
</table>