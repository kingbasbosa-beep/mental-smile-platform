import 'package:mental_smile_os/core/platform_core/platform_core.dart';
import 'package:mental_smile_os/features/library/platform_core/library_section_adapter.dart';

class LibraryRuntimeSignalBridge {
  LibraryRuntimeSignalBridge._();

  static final PlatformCoreSignalBridge bridge = PlatformCoreSignalBridge(
    adapter: const LibrarySectionAdapter(),
  );
}
