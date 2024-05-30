import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/utils/simple_widgets.dart';

class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            ZimpleWidgets.zContainer(
              borderRadius: 15,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding:
                  const EdgeInsets.only(top: 10, left: 20, bottom: 30, right: 40),
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
            /// StatefulTraining는 StatefulWidget로 만들어진 클래스이다.
            /// 현재 이 페이즈는 StatelessWidget로 되어 있어서 위젯에 변화(setState)를 줄 수 없다.
            /// 하지만 변화가 필요한 공간을 StatefulWidget로 만들어진 클래스를 생성해서 변화(setState)를 줄 수 있다.
            const StatefulTraining(),
            const SizedBox(height: 10),
            /// 리스트 뷰의 예시
            /// ListView.separated : List의 item 사이에 위젯(구분선, 간격, etc)을 추가 할 수 있다. 아래는 구분선으로 예시
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (itemBuilder, index) {
                    return listItem(itemBuilder, index);
                  },
                  separatorBuilder: (separatorBuilder, index) {
                    return ZimpleWidgets.zContainer(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        backgroundColor: Colors.white,
                        height: 1);
                  },
                  itemCount: 100),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(BuildContext context, int index) {
    debugPrint('리스트 ${index}번 아이템 생성됨');
    return ZimpleWidgets.zContainer(
      width: MediaQuery.of(context).size.width,
      /// 삼항 연산자로 조건 해결 - 조건식 ? 참 : 거짓
      backgroundColor: index % 2 == 0 ? Colors.white : Colors.grey,
      borderRadius: 8,
      /// 함수로 조건 해결
      alignment: alignment(index),
      /// 아래는 삼항 연산자로 '뇌절' 해놓은 조건문인데... 진짜 가끔은 ('귀찮음'으로 인해) 쓰이기 때문에
      /// 저렇게도 쓸 수 있구나하고 눈으로 만 보고 넘어가고, 될 수 있으면 쓰지 않는 걸 권한다.
      /// 가독성이 안좋고 높은 확률로 실수의 원인이 된다. 하지만 함수를 만드는 '귀찮음'을 해결 할 수 있다.
      // alignment: index % 3 == 0
      //     ? Alignment.center
      //     : index % 3 == 1
      //         ? Alignment.centerLeft
      //         : Alignment.centerRight,
      padding: const EdgeInsets.all(10),
      child: ZimpleWidgets.zText(
        '리스트 번호 : $index',
        color: Colors.black,
      ),
    );
  }

  /// 함수로 조건문을 해결 할 땐 반환(return) 될 값이 무엇으로 반환 되는지 파악 해야 된다.
  Alignment alignment(int index) {
    switch (index % 3) { // index 나누기 3 을 했을 때 나머지 값을 구하는 식으로 신경 안써도 된다.
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
          /// 보통 Widget을 반환하는 함수로 조건이 필요한 위젯을 처리하지만
          /// 간단한 조건에 간단한 위젯엔 if문에 스프레드(...)연산자를 사용해서 조건 별로 위젯을 나열 한다.
          if (counter % 5 != 0) ...{
            ZimpleWidgets.zText('카운터 : $counter',
                color: Colors.white, useBold: true),
          } else ...{
            ZimpleWidgets.zContainer(
              width: 150,
              height: 48,
              backgroundColor: Colors.amber,
              borderRadius: 10,
            )
          },
          const SizedBox(height: 16),
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
