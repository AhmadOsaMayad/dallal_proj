class Funcs {
  static bool? isLeft(int index) =>
      index == 0
          ? true
          : index == 2
          ? false
          : null;

  /// returns relative fraction of width
  /// item [width] in figma ÷ screen width in figma
  static double getWfract(double width) => width / 440;

  /// returns relative fraction of height
  /// item [height] in figma ÷ screen width in figma
  static double getHfract(double height) => height / 956;
}
