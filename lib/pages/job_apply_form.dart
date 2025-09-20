import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JobApplyForm extends StatefulWidget {
  const JobApplyForm({super.key});

  @override
  State<JobApplyForm> createState() => _JobApplyFormState();
}

class _JobApplyFormState extends State<JobApplyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _selectedLocation;
  String _experienceStatus = 'Fresher';
  String? _resumePath;

  Future<void> _pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null) {
      setState(() {
        _resumePath = result.files.single.name;
      });
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_resumePath == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please upload your resume')),
        );
        return;
      }

      // Prepare the data to be stored
      Map<String, dynamic> formData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'location': _selectedLocation,
        'experience_status': _experienceStatus,
        'resume_file_name': _resumePath,
        'submission_date': FieldValue.serverTimestamp(),
      };

      try {
        final firestoreInstance = FirebaseFirestore.instance;
        await firestoreInstance.collection('applications').add(formData);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Application submitted successfully!')),
        );

        // Clear the form fields after successful submission
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        setState(() {
          _selectedLocation = null;
          _experienceStatus = 'Fresher';
          _resumePath = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit application: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Apply Form', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Apply for Job',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Enter your name';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Enter a valid email address';
                      if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(value)) {
                        return 'Enter a valid @gmail.com email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Enter your phone number';
                      if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Enter a valid 10-digit phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedLocation,
                    decoration: const InputDecoration(
                      labelText: 'Select Job Location',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Hyderabad', 'Indore', 'Pune']
                        .map((loc) => DropdownMenuItem(value: loc, child: Text(loc)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedLocation = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please select a location';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Experience Status', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Fresher',
                        groupValue: _experienceStatus,
                        onChanged: (value) {
                          setState(() {
                            _experienceStatus = value!;
                          });
                        },
                      ),
                      const Text('Fresher'),
                      const SizedBox(width: 20),
                      Radio<String>(
                        value: 'Experienced',
                        groupValue: _experienceStatus,
                        onChanged: (value) {
                          setState(() {
                            _experienceStatus = value!;
                          });
                        },
                      ),
                      const Text('Experienced'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _pickResume,
                        child: const Text('Upload Resume'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _resumePath ?? 'No file selected',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Submit Application', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}