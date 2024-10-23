// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_document_scanner/src/bloc/crop/crop.dart';
import 'package:flutter_document_scanner/src/models/area.dart';

class ButtonGetAreaCropPhoto extends StatelessWidget {
  const ButtonGetAreaCropPhoto({
    super.key,
    required this.child,
    required this.position,
    required this.onChangeArea,
    required this.image,
  });

  final Widget child;
  final PositionModel position;
  final void Function(Area area) onChangeArea;
  final File image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.top,
      bottom: position.bottom,
      left: position.left,
      right: position.right,
      child: InkWell(
        onTap: () async {
          onChangeArea(
            await context.read<CropBloc>().getAreaInOriginalSize(image),
          );
        },
        child: child,
      ),
    );
  }
}

class PositionModel {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  PositionModel({
    this.top,
    this.bottom,
    this.left,
    this.right,
  });
}

class GetAreaCropPhotoModel {
  final Widget child;
  final PositionModel position;
  GetAreaCropPhotoModel({
    required this.child,
    required this.position,
  });
}
