import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle()),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Colors.tealAccent],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.JPG'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Navigation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                _onNavigationTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('About Me'),
              onTap: () {
                Navigator.pop(context);
                _onNavigationTapped(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                _onNavigationTapped(2);
              },
            ),
          ],
        ),
      ),
      body: _getBodyContent(),
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
        selectedItemColor: Colors.teal,
        currentIndex: _currentIndex,
        onTap: _onNavigationTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Thanks for viewing my profile!'),
              backgroundColor: Colors.teal,
            ),
          );
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.favorite, color: Colors.white),
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
        return _buildHomePage();
      case 1:
        return _buildAboutPage();
      case 2:
        return _buildContactPage();
      default:
        return _buildHomePage();
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
                const Text(
                  'Eric John C. Martinez',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Software Engineer',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Welcome Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.waving_hand, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Welcome to My Profile!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Hello! I\'m Eric John, a passionate Software Engineer and Information Technology Graduate. I love creating beautiful web and mobile applications and exploring new technologies.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => _onNavigationTapped(1),
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Learn More About Me'),
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

          const SizedBox(height: 20),

          // Quick Stats Card
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.analytics, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Quick Stats',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                  const Row(
                    children: [
                      Icon(Icons.info, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                  const Row(
                    children: [
                      Icon(Icons.touch_app, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Get to Know Me Better',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                        color: Colors.teal.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'Additional Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'I am passionate about mobile app development and love creating beautiful, functional user interfaces. When I\'m not coding, you can find me exploring new technologies, reading tech blogs, or playing video games.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
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
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Skills & Interests',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                  const Row(
                    children: [
                      Icon(Icons.school, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Education',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                  const Row(
                    children: [
                      Icon(Icons.contact_mail, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                  const Row(
                    children: [
                      Icon(Icons.share, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Social Media',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                  const Row(
                    children: [
                      Icon(Icons.message, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Send Me a Message',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Feel free to reach out if you have any questions, want to collaborate on a project, or just want to say hello!',
                    style: TextStyle(fontSize: 16),
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
                      label: const Text('Send Email'),
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
            color: Colors.teal.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
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
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12),
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
          Icon(icon, color: Colors.teal, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$label: $value',
              style: const TextStyle(fontSize: 16),
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
                            color: Colors.teal.withOpacity(0.4),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                          BoxShadow(
                            color: Colors.teal.withOpacity(0.1),
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
                                  Colors.teal.withOpacity(0.3),
                                  Colors.teal.withOpacity(0.5),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : LinearGradient(
                                colors: [
                                  Colors.teal.withOpacity(0.15),
                                  Colors.teal.withOpacity(0.25),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: _isHovered
                              ? Colors.teal.withOpacity(0.8)
                              : Colors.teal.withOpacity(0.4),
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
                              color: Colors.teal[700],
                            ),
                            const SizedBox(width: 6),
                          ],
                          Text(
                            widget.skill,
                            style: TextStyle(
                              color: _isHovered ? Colors.teal[800] : Colors.teal[700],
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
