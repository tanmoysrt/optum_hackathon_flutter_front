import 'package:flutter/material.dart';
import 'package:optum_hackathon/components/button.dart';
import 'package:optum_hackathon/components/input_box.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Profile'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text("Name", style: TextStyle(color: Colors.white),),
                subtitle: Text("Snehanjan Roy", style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                title: Text("E-mail", style: TextStyle(color: Colors.white),),
                subtitle: Text("test@test.com", style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                title: Text("Registered On", style: TextStyle(color: Colors.white),),
                subtitle: Text("12th January,2022", style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                contentPadding: EdgeInsets.zero,
              ),
              Text("Age"),
              const SizedBox(height: 5,),
              InputBox(),
              const SizedBox(height: 5,),
              StyledButton(textInside: "Update Age", fractionalHeight: 0.05),
              const SizedBox(height: 10,),
              Text("Gender"),
              const SizedBox(height: 5,),
              InputBox(),
              const SizedBox(height: 5,),
              StyledButton(textInside: "Update Gender", fractionalHeight: 0.05),
              const SizedBox(height: 10,),
              Text("Blood Group"),
              const SizedBox(height: 5,),
              InputBox(),
              const SizedBox(height: 5,),
              StyledButton(textInside: "Update Blood Group", fractionalHeight: 0.05),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
