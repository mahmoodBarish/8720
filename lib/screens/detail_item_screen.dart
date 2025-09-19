import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class DetailItemScreen extends StatefulWidget {
  const DetailItemScreen({super.key});

  @override
  State<DetailItemScreen> createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  String _selectedSize = 'M'; // Default selected size based on Figma

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable Content
            ListView(
              padding: const EdgeInsets.only(bottom: 150), // Reserve space for the fixed bottom bar
              children: [
                // Top Navigation Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // No explicit background color in Figma, defaulting to transparent
                          ),
                          child: const Icon(Icons.arrow_back_ios_rounded, size: 24, color: Color(0xFF242424)),
                        ),
                      ),
                      // Screen Title
                      Text(
                        'Detail',
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF242424),
                        ),
                      ),
                      // Favourite Button
                      GestureDetector(
                        onTap: () {
                          // Handle favorite action
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.favorite_border, size: 24, color: Color(0xFF242424)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Product Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/I184_204_417_715.png',
                      width: screenWidth - 48, // 327 in Figma corresponds to 375-2*24
                      height: 202,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Product Name, Type, Rating
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Caffe Mocha',
                        style: GoogleFonts.sora(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF242424),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ice/Hot',
                        style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFA2A2A2),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 20,
                            color: Color(0xFFFBB626), // Yellow star color from Figma
                          ),
                          const SizedBox(width: 4),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '4.8 ',
                                  style: GoogleFonts.sora(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF2A2A2A),
                                  ),
                                ),
                                TextSpan(
                                  text: '(230)',
                                  style: GoogleFonts.sora(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFFA2A2A2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Superiority Icons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSuperiorityIcon(
                        'assets/images/I184_198_418_950.png', // Fast Delivery
                      ),
                      _buildSuperiorityIcon(
                        'assets/images/I184_200_418_971.png', // Quality Bean
                      ),
                      _buildSuperiorityIcon(
                        'assets/images/I184_202_418_967.png', // Extra Milk
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Divider Line
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    color: const Color(0xFFE3E3E3),
                    thickness: 1,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 16),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF242424),
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                              'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFFA2A2A2),
                              ),
                            ),
                            TextSpan(
                              text: 'Read More',
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFC67C4E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Size Selection
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Size',
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF242424),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSizeOption('S'),
                          _buildSizeOption('M'),
                          _buildSizeOption('L'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Fixed Bottom Bar
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Container(
                  width: double.infinity,
                  height: 118, // Fixed height from Figma
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 46), // Padding to match Figma including bottom safe area
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Price',
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF909090),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$ 4.53',
                            style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFC67C4E),
                            ),
                          ),
                        ],
                      ),
                      // Buy Now Button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to home or checkout screen
                          // Inferred '/home' as a common next step after buying
                          context.go('/home'); 
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC67C4E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          minimumSize: Size(screenWidth * 0.55, 56), // Responsive width, fixed height
                          elevation: 0, // No shadow for the button
                        ),
                        child: Text(
                          'Buy Now',
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the circular superiority icons
  Widget _buildSuperiorityIcon(String imagePath) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2).withOpacity(0.35), // Background color with opacity from Figma
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10), // Padding around the icon inside the container
      child: Image.asset(
        imagePath,
        width: 24, // Internal icon size
        height: 24,
        fit: BoxFit.contain,
      ),
    );
  }

  // Helper widget to build the size selection options
  Widget _buildSizeOption(String size) {
    bool isSelected = _selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        width: 96,
        height: 41,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF9F2ED) : Colors.white, // Selected background from Figma
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFFE3E3E3), // Selected border from Figma
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          size,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFF242424), // Selected text color
          ),
        ),
      ),
    );
  }
}