import 'section_socket.dart';

abstract interface class PlatformSectionAdapter {
  String get adapterDefaultSocketId;
  String get adapterTestCode;

  SectionSocket createSocket();
}
