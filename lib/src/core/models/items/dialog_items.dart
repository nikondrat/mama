class DialogItem {
  final String title;
  final String subtitle;
  final String? text;
  final Function onTap;

  DialogItem({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.text,
  });
}
