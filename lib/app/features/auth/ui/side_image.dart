import "package:flutter/material.dart";
import "package:amasyaapp/core/images.dart";

class SideImage extends StatelessWidget {
  const SideImage({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - AppBar().preferredSize.height * 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Image.asset(
          Images.loginSideImage,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
