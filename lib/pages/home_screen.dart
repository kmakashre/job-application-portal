import 'package:flutter/material.dart';
import 'job_apply_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        content,
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Job Description', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
          'We are looking for talented 2025 B.Tech freshers for Software Development roles across multiple technologies.',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        toolbarHeight: 180,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Company logo
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 25,
                          width: 25,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Job title
                    Expanded(
                      child: Text(
                        'Software Development Engineer - 2025 Freshers',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Full Time tag
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade600,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Full Time',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Job code
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: Text(
                    'Job Code: BSPL-86902',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Location, positions, expiry
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.white, size: 18),
                      SizedBox(width: 4),
                      Text(
                        'Hyderabad, Indore, Pune',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.work, color: Colors.white, size: 18),
                      SizedBox(width: 4),
                      Text(
                        '5 positions',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.calendar_today, color: Colors.white, size: 18),
                      SizedBox(width: 4),
                      Text(
                        'Expires on 31/10/2025',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSection(
                title: 'Qualifications',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint('B. Tech 2025 freshers with experience on frontend or backend development stack.'),
                    _buildBulletPoint('Angular/React.js or Android/iOS/Flutter or .NET/Node.js or AI/ML.'),
                    _buildBulletPoint('Part of 2025 B. Tech batch with specialization in CS, IT, ECE, EEE or similar.'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildSection(
                title: 'Training Requirements',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1. Excellence on frontend/backend development stack', style: TextStyle(fontWeight: FontWeight.bold)),
                    _buildBulletPoint('Web- Angular/React.js'),
                    _buildBulletPoint('Mobile- Android/iOS/Flutter/React Native'),
                    _buildBulletPoint('.NET/C#, SQL Server/Database, ASP.Net MVC, LINQ'),
                    _buildBulletPoint('NodeJs/Javascript, Mongo DB, Angular.js, Express.js, Knex.js, Swagger'),
                    _buildBulletPoint('Java/J2EE, MySQL/MariaDB, Spring Boot, GIT, Jenkins'),
                    _buildBulletPoint('AI or ML'),
                    const SizedBox(height: 10),
                    const Text('2. Internship or multiple projects preferred.', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text('3. Excellent coding, written and verbal communication.', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildSection(
                title: 'Competencies',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint('Excellent verbal and written communications.'),
                    _buildBulletPoint('Willingness to learn and develop your skill set.'),
                    _buildBulletPoint('Works well within a team environment.'),
                    _buildBulletPoint('Logical thinker with good problem solving skills.'),
                    _buildBulletPoint('Proactive approach to the job.'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const JobApplyForm()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text('Apply'),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
