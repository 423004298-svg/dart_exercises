import 'package:flutter/material.dart';
import '../theme.dart';

/// Screen 2 - Dashboard (static: all values are hard-coded sample data).
///
/// Widget tree (key parts):
/// Scaffold
///  ├ SafeArea > SingleChildScrollView > Padding > Column
///  │   ├ Row                     (avatar Stack + greeting + bell icon)
///  │   ├ Row                     (3 x Expanded _StatCard)
///  │   ├ Container > Row         (progress ring Stack + text)
///  │   ├ Text + Column           (3 x _TaskRow)
///  │   └ Column                  (3 x _SubjectBar)
///  └ NavigationBar               (visual only)
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(Gap.lg, Gap.md, Gap.lg, Gap.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Header(),
              const SizedBox(height: Gap.lg),
              const Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.local_fire_department_rounded,
                      color: AppColors.coral,
                      value: '7',
                      label: 'day streak',
                    ),
                  ),
                  SizedBox(width: Gap.sm),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.star_rounded,
                      color: AppColors.amber,
                      value: '245',
                      label: 'points',
                    ),
                  ),
                  SizedBox(width: Gap.sm),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.schedule_rounded,
                      color: AppColors.mint,
                      value: '3',
                      label: 'due soon',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Gap.md),
              const _ProgressCard(),
              const SizedBox(height: Gap.lg),
              Text('Coming up', style: text.titleLarge),
              const SizedBox(height: Gap.md),
              const _TaskRow(
                title: 'Physics Lab Report',
                subtitle: 'Physics - assignment',
                due: 'Due today',
                color: AppColors.coral,
              ),
              const _TaskRow(
                title: 'Calculus Quiz 3',
                subtitle: 'Math - quiz',
                due: 'Due in 2d',
                color: AppColors.amber,
              ),
              const _TaskRow(
                title: 'Chemistry Project',
                subtitle: 'Chemistry - project',
                due: 'Due in 5d',
                color: AppColors.mint,
              ),
              const SizedBox(height: Gap.lg),
              Text('Study time this week', style: text.titleLarge),
              const SizedBox(height: Gap.md),
              const _SubjectBar(subject: 'Physics', minutes: 140, fraction: 0.9),
              const _SubjectBar(subject: 'Math', minutes: 95, fraction: 0.6),
              const _SubjectBar(subject: 'Chemistry', minutes: 50, fraction: 0.35),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (_) {}, // static UI: no navigation
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.checklist_rounded), label: 'Tasks'),
          NavigationDestination(
              icon: Icon(Icons.emoji_events_outlined), label: 'Badges'),
          NavigationDestination(
              icon: Icon(Icons.groups_outlined), label: 'Groups'),
        ],
      ),
    );
  }
}

/// Header row. The avatar uses a Stack so a level badge can overlap its
/// bottom-right corner (Positioned + Clip.none lets it sit half outside).
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/avatar.png',
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: -6,
              bottom: -4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.amber,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.bg, width: 2),
                ),
                child: Text(
                  'Lv 4',
                  style: text.bodySmall?.copyWith(
                    color: AppColors.bg,
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: Gap.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Good evening,', style: text.bodySmall),
              const SizedBox(height: 2),
              Text('Alex Rivera', style: text.titleLarge),
              Text('Grade 12 - STEM', style: text.bodySmall),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: const Icon(Icons.notifications_none_rounded,
              color: AppColors.text),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: Gap.md, horizontal: Gap.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: Gap.sm),
          Text(value, style: text.titleLarge),
          Text(label, style: text.bodySmall),
        ],
      ),
    );
  }
}

/// Progress ring: a Stack centers the percentage text on top of the ring.
class _ProgressCard extends StatelessWidget {
  const _ProgressCard();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(Gap.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  width: 72,
                  height: 72,
                  child: CircularProgressIndicator(
                    value: 0.6,
                    strokeWidth: 8,
                    backgroundColor: AppColors.border,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.mint),
                  ),
                ),
                Text('60%', style: text.titleMedium),
              ],
            ),
          ),
          const SizedBox(width: Gap.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Weekly progress', style: text.titleMedium),
                const SizedBox(height: Gap.xs),
                Text('6 of 10 tasks completed', style: text.bodySmall),
                const SizedBox(height: Gap.xs),
                Text('1 overdue', style: text.bodySmall?.copyWith(color: AppColors.coral)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TaskRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String due;
  final Color color;

  const _TaskRow({
    required this.title,
    required this.subtitle,
    required this.due,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: Gap.sm + 2),
      padding: const EdgeInsets.symmetric(horizontal: Gap.md, vertical: Gap.md - 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          top: const BorderSide(color: AppColors.border),
          right: const BorderSide(color: AppColors.border),
          bottom: const BorderSide(color: AppColors.border),
          left: BorderSide(color: color, width: 4),
        ),
      ),
      child: Row(
        children: [
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
          const SizedBox(width: Gap.sm),
          Text(due, style: text.bodySmall?.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _SubjectBar extends StatelessWidget {
  final String subject;
  final int minutes;
  final double fraction;

  const _SubjectBar({
    required this.subject,
    required this.minutes,
    required this.fraction,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: Gap.md - 4),
      child: Row(
        children: [
          SizedBox(width: 84, child: Text(subject, style: text.bodySmall)),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: fraction,
                minHeight: 10,
                backgroundColor: AppColors.border,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.mint),
              ),
            ),
          ),
          const SizedBox(width: Gap.sm),
          SizedBox(
            width: 44,
            child: Text('${minutes}m', textAlign: TextAlign.right, style: text.bodySmall),
          ),
        ],
      ),
    );
  }
}
