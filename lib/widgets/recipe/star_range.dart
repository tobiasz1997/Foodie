import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StarRange extends StatefulWidget {
  final double rating;
  final int? totalVoters;
  final StarRangeSizeEnum size;
  final Function? onChange;

  const StarRange({
    super.key,
    required this.rating,
    this.totalVoters,
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

  FaIcon _icon(IconData icon) => FaIcon(
    icon,
    color: Colors.yellow,
    size: size,
    shadows: [
      Shadow(
        offset: const Offset(2, 2),
        blurRadius: 8,
        color: Colors.black.withValues(alpha: 0.5),
      ),
    ],
  );

  Padding _star(int index) {
    var value = ranks[index];
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: GestureDetector(
        onTap: () => _setRating(index),
        child: value == 1
            ? _icon(FontAwesomeIcons.solidStar)
            : value == 0.5
            ? _icon(FontAwesomeIcons.starHalfStroke)
            : _icon(FontAwesomeIcons.star),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var voters = widget.totalVoters;
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) => _star(index)),
        ),
        if (voters != null)
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text('($voters)'),
          ),
      ],
    );
  }
}

enum StarRangeSizeEnum { small, large }
