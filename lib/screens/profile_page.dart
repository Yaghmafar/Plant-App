import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(0.5),
                    width: 5,
                  ),
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'محمد صالح',
                    style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 20,
                      fontFamily: 'Vazir',
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    height: 20,
                    child: Image.asset('assets/images/verified.png'),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'msaleh.y2006@gmail.com',
                style: TextStyle(
                  color: Constants.blackColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30.0),
              // Profile Options
              SizedBox(
                height: size.height * 0.4,
                width: size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BuildOptions(title: 'پروفایل من', icon: Icons.person),
                    BuildOptions(title: 'تنظیمات', icon: Icons.settings),
                    BuildOptions(title: 'اطلاع رسانی‌ها', icon: Icons.notifications),
                    BuildOptions(title: 'شبکه‌های اجتماعی', icon: Icons.share_rounded),
                    BuildOptions(title: 'خروج', icon: Icons.logout),
                  ],
                ),
                // end Profile Options
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildOptions extends StatelessWidget {
  final IconData icon;
  final String title;

  const BuildOptions({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Constants.blackColor.withOpacity(0.4),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'IranSans',
                  color: Constants.blackColor,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5.0),
              Icon(
                icon,
                color: Constants.blackColor.withOpacity(0.5),
                size: 23.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
