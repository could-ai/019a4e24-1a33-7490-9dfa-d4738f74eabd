import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Image Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _promptController = TextEditingController();
  String _selectedStyle = 'Realistic';
  bool _maintainConsistency = true;

  final List<String> _styles = [
    'Realistic',
    'Hyper Realistic',
    'Super Realistic',
    'Photorealistic',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Image Generator'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Placeholder for the generated image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.grey[700]!),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Prompt input field
              TextField(
                controller: _promptController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter your prompt here...',
                  labelText: 'Prompt',
                ),
              ),
              const SizedBox(height: 24),

              // Upload reference image button
              OutlinedButton.icon(
                onPressed: () {
                  // Placeholder for image picking logic
                },
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload Reference Image'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: Colors.grey[700]!),
                ),
              ),
              const SizedBox(height: 24),

              // Style selection
              const Text('Select Style', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _styles.map((style) {
                  return ChoiceChip(
                    label: Text(style),
                    selected: _selectedStyle == style,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedStyle = style;
                        });
                      }
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: _selectedStyle == style ? Colors.white : null,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // Character consistency toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Maintain Character Consistency', style: TextStyle(fontSize: 16)),
                  Switch(
                    value: _maintainConsistency,
                    onChanged: (value) {
                      setState(() {
                        _maintainConsistency = value;
                      });
                    },
                    activeTrackColor: Colors.blue.withOpacity(0.5),
                    activeColor: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Generate button
              ElevatedButton(
                onPressed: () {
                  // Placeholder for image generation logic
                },
                child: const Text('Generate Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
