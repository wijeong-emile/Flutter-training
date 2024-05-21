import 'package:flutter/material.dart';
import 'package:flutter_training/utils/simple_widgets.dart';

class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            ZimpleWidgets.zContainer(
              borderRadius: 15,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding:
                  EdgeInsets.only(top: 10, left: 20, bottom: 30, right: 40),
              backgroundColor: Colors.yellowAccent,
              sideColor: Colors.blue,
              sideWidth: 2,
              child: ZimpleWidgets.zContainer(
                width: 200,
                height: 100,
                alignment: Alignment.center,
                backgroundColor: Colors.amber,
                child: ZimpleWidgets.zText(
                  '텍스트',
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            StatefulTraining(),
            SizedBox(height: 10),
            Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (itemBuilder, index) {
                      return listItem(itemBuilder, index);
                    },
                    separatorBuilder: (separatorBuilder, index) {
                      return ZimpleWidgets.zContainer(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          backgroundColor: Colors.white,
                          height: 1);
                    },
                    itemCount: 100))
          ],
        ),
      ),
    );
  }

  Widget listItem(BuildContext context, int index) {
    return ZimpleWidgets.zContainer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: index % 2 == 0 ? Colors.white : Colors.grey,
      borderRadius: 8,
      //alignment: alignment(index),
      alignment: index % 3 == 0
          ? Alignment.center
          : index % 3 == 1
              ? Alignment.centerLeft
              : Alignment.centerRight,
      padding: EdgeInsets.all(10),
      child: ZimpleWidgets.zText(
        '리스트 번호 : $index',
        color: Colors.black,
      ),
    );
  }

  Alignment alignment(int index) {
    switch (index % 3) {
      case 1:
        return Alignment.centerLeft;
      case 2:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }
}

class StatefulTraining extends StatefulWidget {
  const StatefulTraining({super.key});

  @override
  State<StatefulTraining> createState() => _StatefulTrainingState();
}

class _StatefulTrainingState extends State<StatefulTraining> {
  int counter = 0;

  @override
  void initState() {
    debugPrint('생명주기 : initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    debugPrint('생명주기 : didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('생명주기 : build');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          ZimpleWidgets.zText('카운터 : $counter',
              color: Colors.white, useBold: true),
          SizedBox(height: 16),
          ZimpleWidgets.zTextButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            '카운터 증가',
            fontSize: 16,
            textColor: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 48,
            borderRadius: 10,
          )
        ],
      ),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    debugPrint('생명주기 : deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    debugPrint('생명주기 : dispose');
    super.dispose();
  }
}
