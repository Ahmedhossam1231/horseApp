import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:horse/tree.dart';

void main() {
  runApp(const HorseInfoApp());
}

class HorseInfoApp extends StatelessWidget {
  const HorseInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileViewBody(),
    );
  }
}

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  static const gridData = [
    'Sire\'s side GrandFather',
    'Sire\'s side GrandFather',
    'Dam\'s side GrandFather',
    'Dam\'s side GrandFather',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "images/hrs.jpg",
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.25,
                  height: MediaQuery.sizeOf(context).width * 0.25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffE4AB6E),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/horse.png',
                      ),
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: MediaQuery.sizeOf(context).width * 0.15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 35),
              ),
              const DetailsWidget(
                details: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailItem(
                      header: 'Name',
                      value: 'Not Set',
                    ),
                    DetailItem(
                      header: 'Gender',
                      value: 'Not Set',
                    ),
                    DetailItem(
                      header: 'Date of birth',
                      value: 'Not Set',
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const DetailsWidget(
                details: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailItem(
                      header: 'Breed',
                      value: 'Not Set',
                    ),
                    DetailItem(
                      header: 'Coat',
                      value: 'Not Set',
                    ),
                    DetailItem(
                      header: 'Medical or health Notes',
                      value: 'Not Set',
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const DetailsWidget(
                details: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailItem(
                      header: 'Country of birth',
                      value: 'Not Set',
                    ),
                    DetailItem(
                      header: 'Breeder',
                      value: 'Not Set',
                    ),
                    DetailItem(
                      header: 'Price',
                      value: 'Not Set',
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const DetailsWidget(
                details: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailItem(
                      header: 'National ID',
                      value: 'Not Set',
                    ),
                    DetailItem(
                      header: 'UELN',
                      value: 'Not Set',
                    ),
                    DetailItem(
                      header: 'FEI ID',
                      value: 'Not Set',
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TreeDiagramScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffE4AB6E),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Go to Family Tree',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.header,
    required this.value,
  });

  final String header, value;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        TextField(
          controller: controller,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter Value',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    super.key,
    required this.details,
  });
  final Widget details;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffE4AB6E).withOpacity(0.4),
        ),
        child: details,
      ),
    );
  }
}
