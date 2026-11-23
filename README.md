# ClassQuest - Week 14 Static UI (Flutter)

PC16 Mobile Development with Lab - Week 14: Flutter Foundations & Static UI (Part 2).

Two static, non-interactive screens for ClassQuest, a gamified study habit and deadline tracker for Senior High School STEM students.

| Screen | File | What it shows |
| --- | --- | --- |
| Screen 1 - Welcome / Log in | `lib/screens/welcome_screen.dart` | Hero banner (Stack), feature list, login form drawn with Containers, Log in button |
| Screen 2 - Dashboard | `lib/screens/dashboard_screen.dart` | Avatar with level badge (Stack), stat cards, progress ring, upcoming tasks, study time bars |

Both are `StatelessWidget` classes that share one `ThemeData` (`lib/theme.dart`) for colors, typography and a spacing scale. There is no navigation, validation or state; values are sample data.

## Requirements checklist

- `MaterialApp` + shared `ThemeData`: `lib/main.dart`, `lib/theme.dart`
- `Scaffold`, `Column`, `Row`, `Container`, `Text`, `Icon`: both screens
- `Stack` + `Positioned`: hero banner on Screen 1 (image, gradient, streak badge, title) and avatar level badge + progress ring on Screen 2
- Local image assets: `assets/images/classquest_banner.png` and `assets/images/avatar.png`, registered in `pubspec.yaml` and shown with `Image.asset` (width, height, `BoxFit.cover`)
- Spacing and sizing: `Padding`, `SizedBox`, `Spacer`, `Expanded`; scrollable body to avoid overflow on small phones

## Set up (one time)

This repo contains `lib/`, `assets/`, `test/` and `pubspec.yaml`. Generate the platform folders (android/, ios/, ...) on your machine:

```bash
flutter create .
flutter pub get
```

If `flutter create .` replaces `lib/main.dart` or `test/widget_test.dart` with the default counter app, restore ours from this repository (`git checkout -- lib/main.dart test/widget_test.dart` if you have already committed them).

## Preview each screen (no navigation code)

The initial screen is chosen at launch with a `--dart-define`:

```bash
flutter run                          # Screen 1 - Welcome
flutter run --dart-define=SCREEN=2   # Screen 2 - Dashboard
```

In VS Code you can instead edit the `home:` line in `lib/main.dart` temporarily.

## Verify

```bash
flutter analyze
flutter test
```

Take one screenshot per screen from the emulator/phone and name them `Screen_1.png` and `Screen_2.png`.

## Submission checklist (Google Classroom, items uploaded separately, no ZIP)

- [ ] GitHub repository link (this project; do not commit `build/`)
- [ ] `Screen_1.png`, `Screen_2.png`
- [ ] `Widget_Tree.pdf` (a draft is included in this package; add your name and section)
- [ ] Figma link or screenshot of your two original design screens
- [ ] Files named `LastName_FirstName_Week14` where applicable
