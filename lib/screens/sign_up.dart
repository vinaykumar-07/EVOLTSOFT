import 'package:assignment/widget/appIcon.dart';
import 'package:assignment/widget/big_text.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const AppIcon(
                backgroundColor: Colors.white,
                icon: Icons.person,
                iconColor: Colors.blue,
              ),
              //Hint text
              hintText: "Name",
              //focus Border
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 1.0, color: Colors.white)),
              //enabled border
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const AppIcon(
                backgroundColor: Colors.white,
                icon: Icons.phone,
                iconColor: Colors.blue,
              ),
              //Hint text
              hintText: "Phone Number",
              //focus Border
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 1.0, color: Colors.white)),
              //enabled border
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const AppIcon(
                backgroundColor: Colors.white,
                icon: Icons.email_outlined,
                iconColor: Colors.blue,
              ),
              //Hint text
              hintText: "Email",
              //focus Border
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 1.0, color: Colors.white)),
              //enabled border
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const AppIcon(
                backgroundColor: Colors.white,
                icon: Icons.home_outlined,
                iconColor: Colors.blue,
              ),
              //Hint text
              hintText: "Bio",
              //focus Border
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(width: 1.0, color: Colors.white)),
              //enabled border
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {},
              child: BigText(
                text: "Continue",
                color: Colors.white,
              ))
        ],
      )),
    );
  }
}
