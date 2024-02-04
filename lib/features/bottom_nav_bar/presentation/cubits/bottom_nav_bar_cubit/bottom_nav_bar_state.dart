// ignore_for_file: public_member_api_docs, sort_constructors_first
class BottomNavBarState {
  final int? selectedIndex;
  final int? pageSelectedIndex;
  BottomNavBarState({
    required this.selectedIndex,
    this.pageSelectedIndex,
  });

  factory BottomNavBarState.initial() {
    return BottomNavBarState(
      selectedIndex: 0,
      pageSelectedIndex: 0,
    );
  }

  BottomNavBarState copyWith({
    int? selectedIndex,
    int? pageSelectedIndex,
  }) {
    return BottomNavBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      pageSelectedIndex: pageSelectedIndex ?? this.pageSelectedIndex,
    );
  }

  @override
  String toString() => 'BottomNavBarState(selectedIndex: $selectedIndex, pageSelectedIndex: $pageSelectedIndex)';

  @override
  bool operator ==(covariant BottomNavBarState other) {
    if (identical(this, other)) return true;

    return other.selectedIndex == selectedIndex && other.pageSelectedIndex == pageSelectedIndex;
  }

  @override
  int get hashCode => selectedIndex.hashCode ^ pageSelectedIndex.hashCode;
}
