import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AboutMe_Martinez());
}

class AboutMe_Martinez extends StatelessWidget {
  const AboutMe_Martinez({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eric John C. Martinez - About Me',
      theme: ThemeData(
        // Modern aesthetic color scheme - Purple to Pink gradient theme
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1), // Indigo
          brightness: Brightness.light,
          primary: const Color(0xFF6366F1), // Indigo-500
          secondary: const Color(0xFFEC4899), // Pink-500
          tertiary: const Color(0xFF8B5CF6), // Violet-500
          surface: const Color(0xFFF8FAFC), // Slate-50
          background: const Color(0xFFFFFFFF), // White
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: const Color(0xFF1E293B), // Slate-800
          onBackground: const Color(0xFF334155), // Slate-700
          error: const Color(0xFFEF4444), // Red-500
          onError: Colors.white,
        ),
        useMaterial3: true,
        
        // Custom text theme with Raleway
        textTheme: GoogleFonts.ralewayTextTheme(
          TextTheme(
            displayLarge: GoogleFonts.raleway(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF6366F1),
              letterSpacing: 1.2,
            ),
            displayMedium: GoogleFonts.raleway(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF6366F1),
              letterSpacing: 1.0,
            ),
            headlineLarge: GoogleFonts.raleway(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4338CA), // Indigo-700
            ),
            headlineMedium: GoogleFonts.raleway(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF4338CA),
            ),
            titleLarge: GoogleFonts.raleway(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E293B),
            ),
            titleMedium: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF334155),
            ),
            bodyLarge: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              height: 1.5,
              color: const Color(0xFF475569), // Slate-600
            ),
            bodyMedium: GoogleFonts.raleway(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              height: 1.4,
              color: const Color(0xFF64748B), // Slate-500
            ),
            labelLarge: GoogleFonts.raleway(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        
        // AppBar theme with gradient
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF6366F1),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: GoogleFonts.raleway(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        
        // Card theme with subtle shadows
        cardTheme: CardThemeData(
          elevation: 6,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          shadowColor: const Color(0xFF6366F1).withOpacity(0.1),
        ),
        
        // Elevated button theme with gradient colors
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6366F1),
            foregroundColor: Colors.white,
            elevation: 4,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: GoogleFonts.raleway(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
        
        // FloatingActionButton theme
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFEC4899), // Pink accent
          foregroundColor: Colors.white,
          elevation: 8,
        ),
        
        // Bottom navigation bar theme
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: const Color(0xFF6366F1),
          unselectedItemColor: const Color(0xFF94A3B8), // Slate-400
          selectedLabelStyle: GoogleFonts.raleway(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: GoogleFonts.raleway(
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          backgroundColor: Colors.white,
          elevation: 8,
        ),
        
        // Drawer theme
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
          elevation: 12,
        ),
        
        // Input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF6366F1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF6366F1), width: 2),
          ),
          labelStyle: GoogleFonts.raleway(color: const Color(0xFF6366F1)),
        ),
      ),
      home: const AboutMePage(),
    );
  }
}

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  bool _showDetails = false;
  int _currentIndex = 0;

  void _toggleDetails() {
    setState(() {
      _showDetails = !_showDetails;
    });
  }

  void _onNavigationTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Custom page transition animation
  Widget _buildAnimatedPageTransition(Widget child) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          )),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  // Staggered animation for cards
  Widget _buildAnimatedCard({
    required Widget child,
    required int index,
  }) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 2,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6366F1), // Indigo-500
                    Color(0xFF8B5CF6), // Violet-500
                    Color(0xFFEC4899), // Pink-500
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.JPG'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Navigation',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                'Home',
                style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                _onNavigationTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(
                'About Me',
                style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                _onNavigationTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: Text(
                'Contact',
                style: GoogleFonts.raleway(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                _onNavigationTapped(2);
              },
            ),
          ],
        ),
      ),
      body: _buildAnimatedPageTransition(_getBodyContent()),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.primary,
        currentIndex: _currentIndex,
        onTap: _onNavigationTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Thanks for viewing my profile!'),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.favorite, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }

  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Eric John C. Martinez';
      case 1:
        return 'About Me';
      case 2:
        return 'Contact';
      default:
        return 'Eric John C. Martinez';
    }
  }

  Widget _getBodyContent() {
    switch (_currentIndex) {
      case 0:
        return Container(
          key: const ValueKey('home'),
          child: _buildHomePage(),
        );
      case 1:
        return Container(
          key: const ValueKey('about'),
          child: _buildAboutPage(),
        );
      case 2:
        return Container(
          key: const ValueKey('contact'),
          child: _buildContactPage(),
        );
      default:
        return Container(
          key: const ValueKey('home'),
          child: _buildHomePage(),
        );
    }
  }

  Widget _buildHomePage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Picture Section
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Eric John C. Martinez',
                  style: GoogleFonts.raleway(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6366F1), // Updated to new primary color
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Software Engineer',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    color: const Color(0xFF64748B), // Updated to slate-500
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Welcome Card
          _buildAnimatedCard(
            index: 0,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.waving_hand, color: Color(0xFFEC4899)), // Pink accent
                        const SizedBox(width: 8),
                        Text(
                          'Welcome to My Profile!',
                          style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF6366F1), // Primary color
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Hello! I\'m Eric John, a passionate Software Engineer and Information Technology Graduate. I love creating beautiful web and mobile applications and exploring new technologies.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => _onNavigationTapped(1),
                      icon: const Icon(Icons.arrow_forward),
                      label: Text(
                        'Learn More About Me',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Quick Stats Card
          _buildAnimatedCard(
            index: 1,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.analytics, color: Color(0xFF8B5CF6)), // Violet accent
                        const SizedBox(width: 8),
                        Text(
                          'Quick Stats',
                          style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF6366F1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem('27', 'Years Old'),
                        _buildStatItem('IT', 'Student'),
                        _buildStatItem('Web/Mobile', 'Developer'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Personal Information Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.info, color: Color(0xFF6366F1)),
                      const SizedBox(width: 8),
                      Text(
                        'Personal Information',
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.cake, 'Age', '27 years old'),
                  _buildInfoRow(Icons.school, 'Course', 'Information Technology'),
                  _buildInfoRow(Icons.sports_esports, 'Hobbies', 'Coding, Reading, Gaming'),
                  _buildInfoRow(Icons.location_on, 'Location', 'Calapan City, Oriental Mindoro'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Interactive Element Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.touch_app, color: Color(0xFFEC4899)), // Pink
                      const SizedBox(width: 8),
                      Text(
                        'Get to Know Me Better',
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _toggleDetails,
                    icon: Icon(_showDetails ? Icons.visibility_off : Icons.visibility),
                    label: Text(_showDetails ? 'Hide Details' : 'Show More Details'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                  if (_showDetails) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF6366F1).withOpacity(0.1),
                            const Color(0xFFEC4899).withOpacity(0.1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF6366F1).withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Additional Information',
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF6366F1),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'I am passionate about mobile app development and love creating beautiful, functional user interfaces. When I\'m not coding, you can find me exploring new technologies, reading tech blogs, or playing video games.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Skills and Interests
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFEC4899)), // Pink
                      const SizedBox(width: 8),
                      Text(
                        'Skills & Interests',
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildSkillChip('Flutter'),
                      _buildSkillChip('Laravel'),
                      _buildSkillChip('VueJs'),
                      _buildSkillChip('ReactJs'),
                      _buildSkillChip('Dart'),
                      _buildSkillChip('Web Development'),
                      _buildSkillChip('Mobile Development'),
                      _buildSkillChip('UI/UX Design'),
                      _buildSkillChip('Problem Solving'),
                      _buildSkillChip('Team Collaboration'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Education Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.school, color: Color(0xFF8B5CF6)), // Violet
                      const SizedBox(width: 8),
                      Text(
                        'Education',
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.book, 'Degree', 'Bachelor of Science in Information Technology'),
                  _buildInfoRow(Icons.calendar_today, 'Year', '2022-2023'),
                  _buildInfoRow(Icons.grade, 'Focus', 'Web/Mobile App Development'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contact Information Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.contact_mail, color: Color(0xFF6366F1)),
                      const SizedBox(width: 8),
                      Text(
                        'Contact Information',
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildContactItem(
                    Icons.email,
                    'Email',
                    'eric.martinez@example.com',
                    Colors.red,
                  ),
                  _buildContactItem(
                    Icons.phone,
                    'Phone',
                    '+1 (555) 123-4567',
                    Colors.green,
                  ),
                  _buildContactItem(
                    Icons.location_on,
                    'Location',
                    'Calapan City, Oriental Mindoro',
                    Colors.blue,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Social Media Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.share, color: Color(0xFFEC4899)), // Pink
                      const SizedBox(width: 8),
                      Text(
                        'Social Media',
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildSocialButton(
                      'LinkedIn',
                      Icons.work,
                      Colors.blue[700]!,
                      'Connect on LinkedIn',
                    ),
                  const SizedBox(height: 12),
                  _buildSocialButton(
                    'GitHub',
                    Icons.code,
                    Colors.grey[800]!,
                    'Check out my projects',
                  ),
                  const SizedBox(height: 12),
                  _buildSocialButton(
                    'Twitter',
                    Icons.alternate_email,
                    Colors.blue[400]!,
                    'Follow me on Twitter',
                  ),
                   const SizedBox(height: 12),
                  _buildSocialButton(
                    'Facebook',
                    Icons.facebook,
                    const Color.fromARGB(255, 23, 86, 138),
                    'Follow me on Facebook',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Message Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.message, color: Color(0xFF8B5CF6)), // Violet
                      const SizedBox(width: 8),
                      Text(
                        'Send Me a Message',
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6366F1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Feel free to reach out if you have any questions, want to collaborate on a project, or just want to say hello!',
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Opening email client...'),
                            backgroundColor: Colors.teal,
                          ),
                        );
                      },
                      icon: const Icon(Icons.send),
                      label: Text(
                        'Send Email',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF6366F1).withOpacity(0.1),
                const Color(0xFF8B5CF6).withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF6366F1).withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Text(
            value,
            style: GoogleFonts.raleway(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF6366F1),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.raleway(
            fontSize: 14,
            color: const Color(0xFF64748B), // Slate-500
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.raleway(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(String platform, IconData icon, Color color, String subtitle) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Opening $platform...'),
              backgroundColor: Colors.teal,
            ),
          );
        },
        icon: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Icon(icon, size: 28),
        ),
        label: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              platform,
              style: GoogleFonts.raleway(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.raleway(
                fontSize: 12,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF8B5CF6), size: 20), // Violet accent
          const SizedBox(width: 12),
          Expanded(          child: Text(
            '$label: $value',
            style: GoogleFonts.raleway(
              fontSize: 16,
            ),
          ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return _AnimatedSkillChip(skill: skill);
  }
}

class _AnimatedSkillChip extends StatefulWidget {
  final String skill;

  const _AnimatedSkillChip({required this.skill});

  @override
  State<_AnimatedSkillChip> createState() => _AnimatedSkillChipState();
}

class _AnimatedSkillChipState extends State<_AnimatedSkillChip>
    with TickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late AnimationController _bounceController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    
    // Main animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    
    // Bounce animation controller
    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    
    // Scale animation with elastic curve
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
    
    // Rotation animation
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.02, // Slight rotation in radians
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    // Bounce animation for tap
    _bounceAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  void _onTap() {
    _bounceController.forward().then((_) {
      _bounceController.reverse();
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 600),
              tween: Tween<double>(begin: 0.5, end: 1.5),
              builder: (context, double scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30,
                  ),
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.teal,
        duration: const Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
        _animationController.forward();
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _animationController,
          _bounceController,
        ]),
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value * _bounceAnimation.value,
            child: Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: const Color(0xFF6366F1).withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                          BoxShadow(
                            color: const Color(0xFF8B5CF6).withOpacity(0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : [],
                ),
                child: Material(
                  elevation: _isHovered ? 6 : 2,
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _onTap,
                    borderRadius: BorderRadius.circular(25),
                    splashColor: Colors.teal.withOpacity(0.3),
                    highlightColor: Colors.teal.withOpacity(0.1),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        gradient: _isHovered
                            ? LinearGradient(
                                colors: [
                                  const Color(0xFF6366F1).withOpacity(0.3),
                                  const Color(0xFF8B5CF6).withOpacity(0.4),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : LinearGradient(
                                colors: [
                                  const Color(0xFF6366F1).withOpacity(0.1),
                                  const Color(0xFF8B5CF6).withOpacity(0.15),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _isHovered
                              ? const Color(0xFF6366F1).withOpacity(0.8)
                              : const Color(0xFF6366F1).withOpacity(0.4),
                          width: _isHovered ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_isHovered) ...[
                            Icon(
                              Icons.code,
                              size: 16,
                              color: const Color(0xFF8B5CF6), // Violet
                            ),
                            const SizedBox(width: 6),
                          ],
                          Text(
                            widget.skill,
                            style: GoogleFonts.raleway(
                              color: _isHovered ? const Color(0xFF4338CA) : const Color(0xFF6366F1), // Indigo shades
                              fontWeight: _isHovered ? FontWeight.w700 : FontWeight.w600,
                              fontSize: _isHovered ? 14 : 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
