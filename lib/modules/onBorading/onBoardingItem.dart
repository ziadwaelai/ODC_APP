import 'package:flutter/material.dart';
import 'package:odc_app/modules/onBorading/onBordingModel.dart';

Widget buildBoardingItem(BoardingModel model) => Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          '${model.title}',
          style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '${model.body}',
          style: TextStyle(
            fontSize: 15.0,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
