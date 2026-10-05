import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/eco_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int completedActions = 0;

  // Show a small notification at the bottom
  void showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }

  // Start Your Journey button
  // This does NOT increase the eco-action count.
  void startJourney() {
    showMessage(
      'Welcome! Your eco-friendly journey has started 🌱',
    );
  }

  // Complete an actual eco action
  void completeAction(String action) {
    setState(() {
      completedActions++;
    });

    showMessage(
      '$action completed! Keep making a difference 🌿',
    );
  }

  // Primary button action
  // This does NOT increase the eco-action count.
  void primaryButtonAction() {
    showMessage(
      'Primary action selected 🌱',
    );
  }

  // Show an eco tip
  void showEcoTip() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: AppTheme.primaryGreen,
              ),
              SizedBox(width: 10),
              Text('Eco Tip'),
            ],
          ),
          content: const Text(
            'Switch off lights and electronic devices when you are not using them. Small habits can make a big difference!',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Got it'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ==========================================================
      // APP BAR
      // ==========================================================

      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.eco_outlined),
            SizedBox(width: 10),
            Text('EcoLife'),
          ],
        ),
      ),

      // ==========================================================
      // BODY
      // ==========================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ======================================================
            // HERO SECTION
            // ======================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    AppTheme.lightGreen,
                    AppTheme.mintBackground,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Eco icon
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.eco,
                      color: AppTheme.primaryGreen,
                      size: 32,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Separate Text widgets are used instead of \n
                  Text(
                    'Live Green.',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),

                  Text(
                    'Live Better.',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Small sustainable choices can create a big impact on our planet.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),

                  const SizedBox(height: 22),

                  // Start Your Journey
                  EcoButton(
                    text: 'Start Your Journey',
                    icon: Icons.arrow_forward,
                    onPressed: startJourney,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ======================================================
            // PROGRESS CARD
            // ======================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: AppTheme.lightGreen,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.lightGreen,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.eco,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Eco Actions Completed',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Complete eco-friendly actions below',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '$completedActions',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ======================================================
            // ECO-FRIENDLY CHOICES
            // ======================================================

            Text(
              'Eco-Friendly Choices',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 8),

            Text(
              'Tap an action when you complete it in your daily life.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 18),

            // Save Energy
            _EcoCard(
              icon: Icons.energy_savings_leaf,
              title: 'Save Energy',
              description:
                  'Use energy wisely and reduce unnecessary consumption.',
              onTap: () {
                completeAction('Energy saving');
              },
            ),

            const SizedBox(height: 12),

            // Recycle More
            _EcoCard(
              icon: Icons.recycling,
              title: 'Recycle More',
              description:
                  'Reuse materials and reduce waste whenever possible.',
              onTap: () {
                completeAction('Recycling');
              },
            ),

            const SizedBox(height: 12),

            // Save Water
            _EcoCard(
              icon: Icons.water_drop_outlined,
              title: 'Save Water',
              description: 'Conserve water through simple everyday habits.',
              onTap: () {
                completeAction('Water saving');
              },
            ),

            const SizedBox(height: 30),

            // ======================================================
            // BUTTON STYLE DEMONSTRATION
            // ======================================================

            Text(
              'Design System Buttons',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            Text(
              'Reusable button styles defined by the app-wide theme.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 16),

            // PRIMARY BUTTON

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: primaryButtonAction,
                icon: const Icon(
                  Icons.check_circle_outline,
                ),
                label: const Text(
                  'Primary Button',
                ),
              ),
            ),

            const SizedBox(height: 12),

            // OUTLINED BUTTON

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: showEcoTip,
                icon: const Icon(
                  Icons.lightbulb_outline,
                ),
                label: const Text(
                  'Get an Eco Tip',
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ======================================================
            // DESIGN SYSTEM INFORMATION
            // ======================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppTheme.darkGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.palette_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Eco Design System',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This application uses a consistent eco-themed color palette, typography system and reusable button styles across the entire app.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _Tag(label: 'Green Palette'),
                      _Tag(label: 'Text Theme'),
                      _Tag(label: 'Button Styles'),
                      _Tag(label: 'Material 3'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ==================================================================
// REUSABLE ECO CARD
// ==================================================================

class _EcoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _EcoCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.lightGreen,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: AppTheme.primaryGreen,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppTheme.secondaryGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================================================================
// DESIGN SYSTEM TAG
// ==================================================================

class _Tag extends StatelessWidget {
  final String label;

  const _Tag({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
