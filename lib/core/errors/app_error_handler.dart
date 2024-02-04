class AppErrorHandler {
  final String message;
  final dynamic data;
  final bool status;

  AppErrorHandler({
    required this.message,
    this.data,
    required this.status,
  });

  @override
  String toString() => 'AppErrorHandler(message: $message, data: $data, status: $status)';

  AppErrorHandler copyWith({
    String? message,
    dynamic data,
    bool? status,
  }) {
    return AppErrorHandler(
      message: message ?? this.message,
      data: data ?? this.data,
      status: status ?? this.status,
    );
  }

  @override
  bool operator ==(covariant AppErrorHandler other) {
    if (identical(this, other)) return true;

    return other.message == message && other.data == data && other.status == status;
  }

  @override
  int get hashCode => message.hashCode ^ data.hashCode ^ status.hashCode;
}
