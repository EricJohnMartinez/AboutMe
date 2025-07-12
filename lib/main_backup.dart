import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AboutMe_Masangkay());
}

class AboutMe_Masangkay extends StatelessWidget {
  const AboutMe_Masangkay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vinz Kiro J. Masangkay - About Me',
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
                    backgroundImage: AssetImage('assets/images/me.JPG'),
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
        return 'Vinz Kiro J. Masangkay';
      case 1:
        return 'About Me';
      case 2:
        return 'Contact';
      default:
        return 'Vinz Kiro J. Masangkay';
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
                      image: AssetImage('assets/images/me.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Vinz Kiro J. Masangkay',
                  style: GoogleFonts.raleway(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6366F1),
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'IT Student',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    color: const Color(0xFF64748B),
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
                        const Icon(Icons.waving_hand, color: Color(0xFFEC4899)),
                        const SizedBox(width: 8),
                        Text(
                          'Welcome to My Profile!',
                          style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF6366F1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Hello! I\'m Vinz Kiro, a passionate Information Technology Student. I love exploring beautiful web and mobile applications and learning new technologies.',
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
                        const Icon(Icons.analytics, color: Color(0xFF8B5CF6)),
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
                        _buildStatItem('21', 'Years Old'),
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
          // Personal Information Card with Gesture Detection
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Personal Info',
                            style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
                          ),
                          content: Text(
                            'You tapped on my personal information! Here\'s a fun fact: I love creating beautiful user interfaces and solving complex problems through code.',
                            style: GoogleFonts.raleway(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cool!',
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF6366F1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Row(
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
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.touch_app,
                          size: 16,
                          color: Color(0xFFEC4899),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.cake, 'Age', '21 years old'),
                  _buildInfoRow(Icons.school, 'Course', 'Information Technology'),
                  _buildGestureInfoRow(Icons.sports_esports, 'Hobbies', 'Coding, Reading, Gaming'),
                  _buildInfoRow(Icons.location_on, 'Location', 'San Teodoro, Oriental Mindoro'),
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
                      const Icon(Icons.touch_app, color: Color(0xFFEC4899)),
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
                            'I am eager to learn about mobile app development and love creating beautiful, functional user interfaces. When I\'m not coding, you can find me exploring new technologies, reading tech blogs, or playing video games.',
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

          // Skills and Interests with Gesture Detection
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'You tapped on Skills & Interests! Try long-pressing on any skill chip below.',
                            style: GoogleFonts.raleway(),
                          ),
                          backgroundColor: const Color(0xFFEC4899),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFFEC4899)),
                        const SizedBox(width: 8),
                        Text(
                          'Skills & Interests',
                          style: GoogleFonts.raleway(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF6366F1),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.touch_app,
                          size: 16,
                          color: Color(0xFF6366F1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildGestureSkillChip('Flutter'),
                      _buildGestureSkillChip('Laravel'),
                      _buildGestureSkillChip('VueJs'),
                      _buildGestureSkillChip('ReactJs'),
                      _buildGestureSkillChip('Dart'),
                      _buildGestureSkillChip('Web Development'),
                      _buildGestureSkillChip('Mobile Development'),
                      _buildGestureSkillChip('UI/UX Design'),
                      _buildGestureSkillChip('Problem Solving'),
                      _buildGestureSkillChip('Team Collaboration'),
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
                      const Icon(Icons.school, color: Color(0xFF8B5CF6)),
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
                  _buildInfoRow(Icons.calendar_today, 'Year', '2025-2026'),
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
                    'vinz.masangkay@example.com',
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
                    'San Teodoro, Oriental Mindoro',
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
                      const Icon(Icons.share, color: Color(0xFFEC4899)),
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
                  _buildSocialButton('LinkedIn', Icons.work, Colors.blue[700]!, 'Connect on LinkedIn'),
                  const SizedBox(height: 12),
                  _buildSocialButton('GitHub', Icons.code, Colors.grey[800]!, 'Check out my projects'),
                  const SizedBox(height: 12),
                  _buildSocialButton('Twitter', Icons.alternate_email, Colors.blue[400]!, 'Follow me on Twitter'),
                  const SizedBox(height: 12),
                  _buildSocialButton('Facebook', Icons.facebook, const Color.fromARGB(255, 23, 86, 138), 'Follow me on Facebook'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Contact Form Card
          _ContactFormCard(),
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
            color: const Color(0xFF64748B),
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
          Icon(icon, color: const Color(0xFF8B5CF6), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
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

  // Gesture-enabled info row for hobbies with long press detection
  Widget _buildGestureInfoRow(IconData icon, String label, String value) {
    return GestureDetector(
      onLongPress: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Long press detected on "$label"! Here are more details: Gaming helps me relax, reading keeps me informed about tech trends, and coding is my passion!',
              style: GoogleFonts.raleway(),
            ),
            backgroundColor: const Color(0xFF8B5CF6),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFF8B5CF6).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF8B5CF6), size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '$label: $value',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                ),
              ),
            ),
            const Icon(
              Icons.touch_app,
              size: 16,
              color: Color(0xFF8B5CF6),
            ),
          ],
        ),
      ),
    );
  }

  // Gesture-enabled skill chip with tap and long press
  Widget _buildGestureSkillChip(String skill) {
    return _GestureSkillChip(skill: skill);
  }

  // Regular skill chip for backward compatibility
  Widget _buildSkillChip(String skill) {
    return _GestureSkillChip(skill: skill);
  }
}

// Gesture-enabled skill chip with color change on long press
class _GestureSkillChip extends StatefulWidget {
  final String skill;

  const _GestureSkillChip({required this.skill});

  @override
  State<_GestureSkillChip> createState() => _GestureSkillChipState();
}

class _GestureSkillChipState extends State<_GestureSkillChip> {
  bool _isPressed = false;
  Color _chipColor = const Color(0xFF6366F1);
  double _fontSize = 14.0;

  void _handleTap() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'You tapped on ${widget.skill}! This is one of my favorite technologies to work with.',
          style: GoogleFonts.raleway(),
        ),
        backgroundColor: const Color(0xFF6366F1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _handleLongPress() {
    setState(() {
      _isPressed = !_isPressed;
      _chipColor = _isPressed ? const Color(0xFFEC4899) : const Color(0xFF6366F1);
      _fontSize = _isPressed ? 16.0 : 14.0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Long press on ${widget.skill}! Color and size changed. Press again to reset.',
          style: GoogleFonts.raleway(),
        ),
        backgroundColor: const Color(0xFFEC4899),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onLongPress: _handleLongPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _chipColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _chipColor,
            width: 1.5,
          ),
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: _chipColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: GoogleFonts.raleway(
                fontSize: _fontSize,
                fontWeight: FontWeight.w600,
                color: _chipColor,
              ),
              child: Text(widget.skill),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.touch_app,
              size: 12,
              color: _chipColor.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}

// Contact Form Widget with validation and gesture detection
class _ContactFormCard extends StatefulWidget {
  @override
  State<_ContactFormCard> createState() => _ContactFormCardState();
}

class _ContactFormCardState extends State<_ContactFormCard> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name should not be empty';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email should not be empty';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email format';
    }
    return null;
  }

  String? _validateMessage(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Message/Comment should not be empty';
    }
    if (value.trim().length < 10) {
      return 'Message should have a minimum length of 10 characters';
    }
    return null;
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSubmitting = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isSubmitting = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Thank you for your feedback!'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );

        _nameController.clear();
        _emailController.clear();
        _messageController.clear();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fix the errors above'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('You tapped on the contact form!'),
                      backgroundColor: const Color(0xFF6366F1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                onLongPress: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Long press detected! Form expanded.'),
                      backgroundColor: const Color(0xFFEC4899),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF6366F1),
                        Color(0xFF8B5CF6),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.contact_mail, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        'Contact Us',
                        style: GoogleFonts.raleway(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              Text(
                'Send us your feedback or questions. We\'d love to hear from you!',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  height: 1.5,
                  color: const Color(0xFF64748B),
                ),
              ),
              
              const SizedBox(height: 20),

              TextFormField(
                controller: _nameController,
                validator: _validateName,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your full name',
                  prefixIcon: const Icon(Icons.person, color: Color(0xFF6366F1)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF6366F1), width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                validator: _validateEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email address',
                  prefixIcon: const Icon(Icons.email, color: Color(0xFF6366F1)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF6366F1), width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _messageController,
                validator: _validateMessage,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Message/Comment',
                  hintText: 'Enter your message (minimum 10 characters)',
                  prefixIcon: const Icon(Icons.message, color: Color(0xFF6366F1)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF6366F1), width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: _isSubmitting ? null : _submitForm,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      gradient: _isSubmitting 
                        ? LinearGradient(
                            colors: [
                              Colors.grey.shade400,
                              Colors.grey.shade500,
                            ],
                          )
                        : const LinearGradient(
                            colors: [
                              Color(0xFF6366F1),
                              Color(0xFF8B5CF6),
                              Color(0xFFEC4899),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6366F1).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_isSubmitting)
                          const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        else
                          const Icon(Icons.send, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          _isSubmitting ? 'Submitting...' : 'Submit',
                          style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        'Contact Tips',
                        style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
                      ),
                      content: Text(
                        'For faster response:\n• Be specific in your message\n• Include relevant details\n• Check your email for our reply',
                        style: GoogleFonts.raleway(),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Got it!',
                            style: GoogleFonts.raleway(
                              color: const Color(0xFF6366F1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF6366F1).withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: Color(0xFF6366F1),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Tap here for contact tips and faster response guidelines',
                          style: GoogleFonts.raleway(
                            fontSize: 14,
                            color: const Color(0xFF6366F1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
