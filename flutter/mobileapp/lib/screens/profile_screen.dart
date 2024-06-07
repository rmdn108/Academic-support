import 'package:flutter/material.dart';
import '../models/professor.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  Professor _professor = Professor(
    name: 'John Doe',
    bio: 'Experienced Math Professor',
    subjects: 'Math, Algebra, Geometry',
    qualifications: 'Ph.D. in Mathematics',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              initialValue: _professor.name,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
                _professor.name = value!;
              },
            ),
            TextFormField(
              initialValue: _professor.bio,
              decoration: InputDecoration(labelText: 'Bio'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a bio';
                }
                return null;
              },
              onSaved: (value) {
                _professor.bio = value!;
              },
            ),
            TextFormField(
              initialValue: _professor.subjects,
              decoration: InputDecoration(labelText: 'Subjects of Expertise'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your subjects of expertise';
                }
                return null;
              },
              onSaved: (value) {
                _professor.subjects = value!;
              },
            ),
            TextFormField(
              initialValue: _professor.qualifications,
              decoration: InputDecoration(labelText: 'Qualifications'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your qualifications';
                }
                return null;
              },
              onSaved: (value) {
                _professor.qualifications = value!;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Save Profile'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Save profile logic, for now we just show a dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Profile Saved'),
                      content: Text('Your profile has been updated.'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
