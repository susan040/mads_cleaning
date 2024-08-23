import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServiceForm(),
    );
  }
}

class ServiceForm extends StatelessWidget {
  final TextEditingController windowMessageController = TextEditingController();
  final TextEditingController houseMessageController = TextEditingController();
  final TextEditingController leaseMessageController = TextEditingController();
  final TextEditingController carpetMessageController = TextEditingController();
  final TextEditingController commercialMessageController = TextEditingController();
  final TextEditingController buildersMessageController = TextEditingController();
  final TextEditingController lawnMessageController = TextEditingController();
  final TextEditingController rubbishMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cleaning Services Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Window Cleaning Section
            ServiceSection(
              title: 'Window Cleaning',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropdown(label: 'Inside'),
                  CustomDropdown(label: 'Outside'),
                  CustomDropdown(label: 'Windows Tracks and Frames'),
                  CustomTextField(label: 'Number of Windows'),
                  CustomTextField(label: 'Number of Story (House)'),
                  CustomTextField(
                    label: 'Message Box',
                    controller: windowMessageController,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // House Cleaning Section
            ServiceSection(
              title: 'House Cleaning',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(label: 'Number of Bedrooms'),
                  CustomTextField(label: 'Number of Bathrooms'),
                  CustomTextField(label: 'Number of Story (House)'),
                  CustomDropdown(label: 'Frequency of Cleaning', options: ['Weekly', 'Fortnightly', 'Monthly']),
                  CustomTextField(
                    label: 'Message Box',
                    controller: houseMessageController,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // End of Lease Cleaning Section
            ServiceSection(
              title: 'End of Lease Cleaning',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(label: 'Number of Bedrooms'),
                  CustomTextField(label: 'Number of Bathrooms'),
                  CustomDropdown(label: 'Window cleaning Inside only'),
                  CustomDropdown(label: 'Windows Cleaning Outside only'),
                  CustomDropdown(label: 'Oven and Stove cleaning'),
                  CustomDropdown(label: 'Wall cleaning'),
                  CustomTextField(label: 'Carpet Steam cleaning (Please mention the number of carpet areas)'),
                  CustomTextField(
                    label: 'Message Box',
                    controller: leaseMessageController,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Carpet Cleaning Section
            ServiceSection(
              title: 'Carpet Cleaning',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(label: 'Carpet Steam cleaning (Please mention the number of carpet areas)'),
                  CustomTextField(label: 'Stains on the carpet, please include Number of stain area and type of stain'),
                  CustomTextField(
                    label: 'Message Box',
                    controller: carpetMessageController,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Commercial Premise Cleaning Section
            ServiceSection(
              title: 'Commercial Premise Cleaning',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(label: 'Type of Commercial space'),
                  Text('The site visit is required to quote the price'),
                  CustomTextField(
                    label: 'Message Box',
                    controller: commercialMessageController,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Builders Cleaning Section
            ServiceSection(
              title: 'Builders Cleaning',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(label: 'Type of Commercial space'),
                  Text('The site visit is required to quote the price'),
                  CustomTextField(
                    label: 'Message Box',
                    controller: buildersMessageController,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Lawn Service Section
            ServiceSection(
              title: 'Lawn Service',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropdown(label: 'Lawn Mowing'),
                  CustomDropdown(label: 'Trimming'),
                  CustomDropdown(label: 'Weeding'),
                  CustomDropdown(label: 'Pruning'),
                  CustomTextField(
                    label: 'Message Box',
                    controller: lawnMessageController,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Rubbish Removal Section
            ServiceSection(
              title: 'Rubbish Removal',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(label: 'Number of Mattress'),
                  CustomTextField(label: 'Number of Tyres'),
                  CustomTextField(label: 'Number of Furniture Items'),
                  Text('For other kinds of Rubbish, please use the message box below'),
                  CustomTextField(
                    label: 'Message Box',
                    controller: rubbishMessageController,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widgets for form fields

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final int maxLines;

  CustomTextField({required this.label, this.controller, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> options;

  CustomDropdown({required this.label, this.options = const ['Yes', 'No']});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (value) {
          // Handle selection
        },
      ),
    );
  }
}

class ServiceSection extends StatelessWidget {
  final String title;
  final Widget content;

  ServiceSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        content,
      ],
    );
  }
}
