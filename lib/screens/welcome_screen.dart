import 'package:flutter/material.dart';
import '../theme.dart';

/// Screen 1 - Welcome / Log in (static: no validation, no navigation).
///
/// Widget tree (key parts):
/// Scaffold
///  └ SafeArea
///     └ SingleChildScrollView
///        └ Column
///           ├ _HeroBanner            (Stack: Image.asset + overlay + badge + title)
///           └ Padding
///              └ Column
///                 ├ Text, Text
///                 ├ _FeatureRow x3   (Row: icon box + Expanded Column)
///                 ├ _FakeField x2    (Container > Row)
///                 ├ Row              (remember me + Spacer + forgot password)
///                 ├ ElevatedButton
///                 └ Text
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HeroBanner(),
              Padding(
                padding: const EdgeInsets.all(Gap.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Study smarter, one streak at a time',
                        style: text.titleLarge),
                    const SizedBox(height: Gap.sm),
                    Text(
                      'Track every deadline, log your study sessions and '
                      'earn points, streaks and badges.',
                      style: text.bodySmall,
                    ),
                    const SizedBox(height: Gap.lg),
                    const _FeatureRow(
                      icon: Icons.checklist_rounded,
                      color: AppColors.amber,
                      title: 'Deadline tracker',
                      subtitle: 'Assignments, quizzes and projects in one list',
                    ),
                    const SizedBox(height: Gap.md),
                    const _FeatureRow(
                      icon: Icons.local_fire_department_rounded,
                      color: AppColors.coral,
                      title: 'Streaks and points',
                      subtitle: 'Stay consistent and level up every day',
                    ),
                    const SizedBox(height: Gap.md),
                    const _FeatureRow(
                      icon: Icons.groups_rounded,
                      color: AppColors.mint,
                      title: 'Group study',
                      subtitle: 'Agree on a shared schedule with classmates',
                    ),
                    const SizedBox(height: Gap.xl),
                    const _FakeField(
                      label: 'School email',
                      icon: Icons.mail_outline_rounded,
                    ),
                    const SizedBox(height: Gap.md),
                    const _FakeField(
                      label: 'Password',
                      icon: Icons.lock_outline_rounded,
                      trailing: Icons.visibility_off_outlined,
                    ),
                    const SizedBox(height: Gap.md),
                    Row(
                      children: [
                        const Icon(Icons.check_box_outline_blank_rounded,
                            size: 20, color: AppColors.textMuted),
                        const SizedBox(width: Gap.sm),
                        Text('Remember me', style: text.bodySmall),
                        const Spacer(),
                        Text(
                          'Forgot password?',
                          style: text.bodySmall?.copyWith(color: AppColors.amber),
                        ),
                      ],
                    ),
                    const SizedBox(height: Gap.lg),
                    ElevatedButton(
                      onPressed: () {}, // static UI: intentionally does nothing
                      child: Text('Log in', style: text.labelLarge),
                    ),
                    const SizedBox(height: Gap.md),
                    Center(
                      child: Text('New here? Create an account',
                          style: text.bodySmall),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Hero banner: the Stack layers an image, a dark gradient (so the title stays
/// readable), a streak badge pinned top-right and the app title bottom-left.
class _HeroBanner extends StatelessWidget {
  const _HeroBanner();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Stack(
      children: [
        // Layer 1: local image asset.
        Image.asset(
          'assets/images/classquest_banner.png',
          width: double.infinity,
          height: 240,
          fit: BoxFit.cover,
        ),
        // Layer 2: gradient fade into the page background.
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.bg.withOpacity(0.95),
                ],
              ),
            ),
          ),
        ),
        // Layer 3: streak badge (top-right).
        Positioned(
          top: Gap.md,
          right: Gap.md,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.surface.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.amber),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.local_fire_department_rounded,
                    size: 16, color: AppColors.amber),
                const SizedBox(width: Gap.xs),
                Text('7-day streak', style: text.bodySmall?.copyWith(color: AppColors.text)),
              ],
            ),
          ),
        ),
        // Layer 4: title (bottom-left).
        Positioned(
          left: Gap.lg,
          bottom: Gap.md,
          right: Gap.lg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ClassQuest', style: text.headlineMedium),
              const SizedBox(height: Gap.xs),
              Text('Gamified study habit and deadline tracker',
                  style: text.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  const _FeatureRow({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: Gap.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: text.titleMedium),
              const SizedBox(height: 2),
              Text(subtitle, style: text.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}

/// A non-interactive "text field" drawn with Container + Row (static UI).
class _FakeField extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconData? trailing;

  const _FakeField({required this.label, required this.icon, this.trailing});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: Gap.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceRaised,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.textMuted),
          const SizedBox(width: Gap.md),
          Expanded(child: Text(label, style: text.bodySmall)),
          if (trailing != null)
            Icon(trailing, size: 20, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
