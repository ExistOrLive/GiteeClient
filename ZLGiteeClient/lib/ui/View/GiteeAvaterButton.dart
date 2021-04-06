import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GiteeAvatarButton extends StatelessWidget {
  final String _avatarURL;
  double width = 50;

  GiteeAvatarButton(this._avatarURL, {this.width});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipOval(child: () {
      if (_avatarURL != null && _avatarURL.isNotEmpty) {
        return FadeInImage.assetNetwork(
            placeholder: "assets/images/default_avatar.png",
            fit: BoxFit.contain,
            image: _avatarURL ?? "",
            width: width);
      } else {
        return Image.asset("assets/images/default_avatar.png", width: width);
      }
    }());
  }
}
