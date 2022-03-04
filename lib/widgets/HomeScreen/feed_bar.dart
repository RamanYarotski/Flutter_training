import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/models/user.dart';

TextStyle userNameTextStyle =
    const TextStyle(fontSize: 8, color: subtitleTextColor);

TextStyle itemTitleTextStyle = const TextStyle(fontSize: 18);
TextStyle itemTitleTextStyleBold =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

TextStyle itemSubTitleTextStyle =
    const TextStyle(fontSize: 12, color: subtitleTextColor);
TextStyle itemSubTitleTextStyleBold = const TextStyle(
    fontSize: 12, color: subtitleTextColor, fontWeight: FontWeight.bold);

Row _itemTextRow(
    User currentUser, TextStyle itemTextStyle, TextStyle itemSecondTextStyle) {
  return Row(
    children: [
      Text(currentUser.number.toString(), style: itemTextStyle),
      const SizedBox(
        width: 4,
      ),
      Text(currentUser.numberValue.toString(), style: itemTextStyle),
      const SizedBox(
        width: 4,
      ),
      Text(currentUser.time.toString(), style: itemSecondTextStyle),
    ],
  );
}

Widget _circleAvatar(String imageRoute) {
  return CircleAvatar(
    backgroundImage: AssetImage(imageRoute),
    radius: avatarSize,
  );
}

class FeedBar extends StatelessWidget {
  const FeedBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, int index) {
        final currentUser = users[index];
        return Card(
            margin: const EdgeInsets.only(top: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      _circleAvatar(currentUser.avatarSource),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        currentUser.userName,
                        style: userNameTextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _itemTextRow(currentUser, itemTitleTextStyleBold,
                          itemTitleTextStyle),
                      const SizedBox(
                        height: 8,
                      ),
                      _itemTextRow(currentUser, itemSubTitleTextStyleBold,
                          itemSubTitleTextStyle),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      iconSize: 22,
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: gray70,
                      )),
                ],
              ),
            ));
      },
    ));
  }
}
