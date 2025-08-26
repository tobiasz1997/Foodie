import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StarRange extends StatefulWidget {
  final double rating;
  final StarRangeSizeEnum size;
  final Function? onChange;

  const StarRange({
    super.key,
    required this.rating,
    this.size = StarRangeSizeEnum.large,
    this.onChange,
  });

  @override
  State<StarRange> createState() => _StarRangeState();
}

class _StarRangeState extends State<StarRange> {
  late double localRating;
  late List<double> ranks;
  late double size;

  @override
  void initState() {
    localRating = widget.rating;
    size = widget.size == StarRangeSizeEnum.small ? 15 : 24;
    setRanksArray();
    super.initState();
  }

  void setRanksArray() {
    ranks = [0, 0, 0, 0, 0];
    if (localRating >= 5) {
      ranks = [1, 1, 1, 1, 1];
    } else if (localRating > 0) {
      for (var i = 0; i < 5; i++) {
        var value = localRating - i;
        if (value >= 1) {
          ranks[i] = 1;
        } else if (value >= 0.5) {
          ranks[i] = 0.5;
        }
      }
    }
  }

  void _setRating(int index) {
    if (widget.onChange != null) {
      setState(() {
        localRating = (index + 1).toDouble();
        setRanksArray();
      });
    }
  }

  Padding _star(int index) {
    var value = ranks[index];
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: GestureDetector(
        onTap: () => _setRating(index),
        child: value == 1
            ? FaIcon(
                FontAwesomeIcons.solidStar,
                color: Colors.yellow,
                size: size,
              )
            : value == 0.5
                ? FaIcon(
                    FontAwesomeIcons.starHalfStroke,
                    color: Colors.yellow,
                    size: size,
                  )
                : FaIcon(
                    FontAwesomeIcons.star,
                    color: Colors.yellow,
                    size: size,
                  ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) => _star(index)),
    );
  }
}

enum StarRangeSizeEnum { small, large }
