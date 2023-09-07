import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SlackIdentity extends StatefulWidget {
  const SlackIdentity({super.key});

  @override
  State<SlackIdentity> createState() => _SlackIdentityState();
}

class _SlackIdentityState extends State<SlackIdentity> {
  final Uri githubProfileUrl =
      Uri(scheme: 'https', host: 'github.com', path: 'mjsalisu');
  final String slackProfilePicture =
      'https://ca.slack-edge.com/T05FFAA91JP-U05RYHPNSSC-50c3033b4fbb-512';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Slack Identity'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(slackProfilePicture),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Jamilu Salisu',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Software Engineer',
                style: TextStyle(fontSize: 18),
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '@mjsalisu',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                      text: ' | (he/him)',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              const Text(
                'Contact information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text('Email Address'),
                subtitle: Text(
                  'jamilusalis@gmail.com',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.call),
                title: Text('Phone'),
                subtitle: Text(
                  '+2348028752833',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              const Text(
                'About me',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const ListTile(
                title: Text('Start Date'),
                subtitle: Text('Sep 7, 2023 (2 hours ago)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _launchURL(githubProfileUrl);
                },
                child: const Text('Open GitHub'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
