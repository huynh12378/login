import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../ReadLiveData/read_live_data.dart';
class HomeController extends StatelessWidget {
  const HomeController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ReadLiveData();
                  },
                ),
              );
            },
            child: Text(
              "a".toUpperCase(),
            ),
          ),
           ElevatedButton(
            onPressed: () {},
            child: Text(
              "b".toUpperCase(),
            ),
          ),
           ElevatedButton(
            onPressed: () {},
            child: Text(
              "c".toUpperCase(),
            ),
          ),
           ElevatedButton(
            onPressed: () {},
            child: Text(
              "d".toUpperCase(),
            ),
          ),
          const SizedBox(height: defaultPadding),
          
        ],
      ),
    );
  }
}
