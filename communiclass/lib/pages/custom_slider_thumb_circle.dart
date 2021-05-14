import 'package:flutter/material.dart';
import 'package:communiclass/models/user.dart';

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    @required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
    double textScaleFactor,
    Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: getValue(value),
    );

    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}

class SliderWidget extends StatefulWidget {
  final double sliderHeight = 48;
  final int min =1;
  final int max =10;
  final fullWidth = false;
  final User _user;

  SliderWidget(this._user);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();

}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 1;

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .3;

    return Column(
      children: [
        Container(
          width: this.widget.fullWidth
              ? double.infinity
              : (this.widget.sliderHeight) * 5.5,
          height: (this.widget.sliderHeight),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(
              Radius.circular((this.widget.sliderHeight * .3)),
            ),
            gradient: new LinearGradient(
                colors: [
                  Colors.deepPurple[100],
                  Colors.deepPurple[900],
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.00),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(this.widget.sliderHeight * paddingFactor,
                2, this.widget.sliderHeight * paddingFactor, 2),
            child: Row(
              children: <Widget>[
                Text(
                  '${this.widget.min}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: this.widget.sliderHeight * .3,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: this.widget.sliderHeight * .1,
                ),
                Expanded(
                  child: Center(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white.withOpacity(1),
                        inactiveTrackColor: Colors.white.withOpacity(.5),

                        trackHeight: 4.0,
                        thumbShape: CustomSliderThumbCircle(
                          thumbRadius: this.widget.sliderHeight * .4,
                          min: this.widget.min,
                          max: this.widget.max,
                        ),
                        overlayColor: Colors.white.withOpacity(.4),
                        //valueIndicatorColor: Colors.white,
                        activeTickMarkColor: Colors.red,
                        inactiveTickMarkColor: Colors.red.withOpacity(.7),
                      ),
                      child: Slider(
                          value: _value,
                          activeColor: Colors.grey[900],
                          inactiveColor: Colors.deepPurple[100],
                          onChanged: (value) {
                            setState(() {
                              //TODO update server
                              _value = value;
                            });
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  width: this.widget.sliderHeight * .1,
                ),
                Text(
                  '${this.widget.max}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: this.widget.sliderHeight * .3,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: ElevatedButton(onPressed: () {
            int value  = (widget.min + (widget.max - widget.min) * _value).round();
            print(widget._user.uid);
          },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple[900],
            ),
            child: Text(
              "Submit",
              style: TextStyle(
                fontSize: 17.0,
                letterSpacing: 0.8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
