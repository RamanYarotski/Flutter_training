import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/models/user.dart';

TextStyle userNameTextStyle = const TextStyle(
    fontSize: 8, color: subtitleTextColor, overflow: TextOverflow.ellipsis,);

TextStyle itemTitleTextStyle =
    const TextStyle(fontSize: 18, overflow: TextOverflow.fade,);
TextStyle itemTitleTextStyleBold =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

TextStyle itemSubTitleTextStyle = const TextStyle(
    fontSize: 12, color: subtitleTextColor, overflow: TextOverflow.ellipsis);
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
      Expanded(child: Text(currentUser.time.toString(), style: itemSecondTextStyle,maxLines: 1, softWrap:false ,)),
    ],
  );
}

Widget _circleAvatar(String imageRoute) {
  return CircleAvatar(
    backgroundImage: AssetImage(imageRoute),
    radius: avatarSize,
  );
}

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.currentUser}) : super(key: key);

  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: avatarSize*3,
                child: Column(
                  children: [
                    _circleAvatar(currentUser.avatarSource),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      currentUser.userName,
                      style: userNameTextStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _itemTextRow(
                        currentUser, itemTitleTextStyleBold, itemTitleTextStyle),
                    const SizedBox(
                      height: 8,
                    ),
                    _itemTextRow(currentUser, itemSubTitleTextStyleBold,
                        itemSubTitleTextStyle),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
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
  }
}
