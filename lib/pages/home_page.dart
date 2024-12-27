import 'package:flutter/material.dart';
import 'package:go_moon/widgets/custom_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: deviceHeight,
          width: deviceWidth,
          padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.05,
          ),
          child: Stack(
            children: [
              // The Column contains the main content of the page
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitle(),
                  _bookARideWidget(context),
                ],
              ),
              
              // Positioned widget for the astro image overlay
              Positioned(
                bottom: deviceHeight*0.2, // Position it at the bottom of the screen
                left: deviceWidth * 0.33, // Align it towards the right
                child: _astroImageWidget(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Screen title
  Widget _pageTitle() {
    return const Text(
      "#Go Moon",
      style: TextStyle(
          color: Colors.white, fontSize: 60, fontWeight: FontWeight.w800),
    );
  }

  // Astro Image Widget
  Widget _astroImageWidget(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: deviceHeight * 0.56, // Adjusted the size
      width: deviceWidth * 0.67,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/astro_moon.png"),
          fit: BoxFit.contain, // Added box fit to control the image scaling
        ),
      ),
    );
  }

  Widget _dropDownWidget(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomDropdownWidget(
      values: const ["Alade Station", "Jaye Station"], // Your list of stations
      width: screenWidth, // Pass the screen width to the widget
    );
  }

  Widget _bookARideWidget(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _dropDownWidget(context),
          _travellerInfoWidget(context),
          _rideButton(context)
        ],
      ),
    );
  }

  Widget _travellerInfoWidget(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomDropdownWidget(
          values: const ["1", "2", "3", "4"], // Your list of stations
          width: screenWidth * 0.43, // Pass the screen width to the widget
        ),
        CustomDropdownWidget(
          values: const [
            "Economy",
            "Private",
            "First-Class",
          ], // Your list of stations
          width: screenWidth * 0.43, // Pass the screen width to the widget
        ),
      ],
    );
  }

  Widget _rideButton(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenWidth,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: MaterialButton(
          onPressed: () {},
          child: const Text(
            "Book Ride",
            style: TextStyle(color: Colors.black),
          ),
        ));
  }
}
