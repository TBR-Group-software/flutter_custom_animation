<p float = "center", align="center ">
     <img src="https://user-images.githubusercontent.com/86306159/146153040-30e9d544-f839-4207-a721-e545f1ec5b18.png" width = "250" />
</p>

## About the project
Shop app with soft, eye-pleasing design and smooth custom Flutter animations.

This project includes custom-made animations using standard Flutter tools such as implicit and explicit animations.

<p float="center", align="justify ">
  <img src="https://user-images.githubusercontent.com/86306159/146012473-7d809953-f405-4ef7-819f-bd999016acb3.gif" width="200" />
  <img src="https://user-images.githubusercontent.com/86306159/146012576-ad6bb151-d1ec-495a-ad6e-1e5735c5b2f7.gif" width="200" />
  <img src="https://user-images.githubusercontent.com/86306159/146012582-0bf80262-9ed6-4f4d-aa85-7794551b4ff6.gif" width="200" />
  <img src="https://user-images.githubusercontent.com/86306159/146012586-bb0039b1-157b-43e3-af9c-403514c0f11f.gif" width="200" />
</p>

## Features
- Soft, eye-pleasing design.
- Animated splash screen.
- Transition animations.
- Switch product animation.

## Splash screen animation
```dart
_secondController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..animateTo(3).then(
        (_) {
          _mainController.reverse();
          _secondController.animateTo(1).then((_) {
            if (widget.onAnimationFinish != null) {
              widget.onAnimationFinish!();
            }
          });
        },
      );
}
```

```dart
_animation =
     CurvedAnimation(parent: _mainController, curve: Curves.easeInQuad);
```
## Product initial animation
```dart
_secondScaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _secondScaleController.forward();
```

```dart
 _secondScaleController.drive(
        Tween<double>(end: 0, begin: 200),
      ),
```

## Switch product animation
```dart
GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          if (reversed) {
            controller.forward();
          } else {
            controller.reverse();
          }
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          if (reversed) {
            controller.reverse();
          } else {
            controller.forward();
          }
        }
      },
      child: child,
    );
```


## Built with
- [Flutter](https://flutter.dev/) - Beautiful native apps in record time.
- [IntelliJ IDEA](https://www.jetbrains.com/ru-ru/idea/) - Code Editing.
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) - To separate architecture into loosely coupled layers.
- [Flutter BloC](https://pub.dev/packages/flutter_bloc) - State Management for separating the UI from Business Logic.
- [Get It](https://pub.dev/packages/get_it) - Dependency Injection.

## Getting Started


**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/TBR-Group-software/flutter_custom_animation
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

## License
This project is licensed under the GNU GPL v3 License - see the [LICENSE.md](https://github.com/TBR-Group-software/flutter_cryptocurrency_charts/blob/main/LICENSE) file for details.
