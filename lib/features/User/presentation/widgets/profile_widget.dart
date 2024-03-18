import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_chat/core/theme/styes.dart';
import 'package:go_chat/core/utils/img_assets.dart';

class ProfileWidget extends StatefulWidget {
  String? imageUrl;
  File? image;

  ProfileWidget({Key? key, this.imageUrl, this.image}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.image == null ||widget.image!.path ==''
        ? (widget.imageUrl == null || widget.imageUrl == ''
            ? Image.asset(
                ImgAssets.PROFILE_DEFAULT,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: widget.imageUrl!,
                progressIndicatorBuilder: (context, url, progress) =>
                    const CircularProgressIndicator(color: tabColor),
                errorWidget: (context, url, error) => Image.asset(
                  ImgAssets.PROFILE_DEFAULT,
                  fit: BoxFit.cover,
                ),
              ))
        : Image.file(
            widget.image!,
            fit: BoxFit.cover,
          );
  }
}
