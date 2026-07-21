import 'package:flutter/material.dart';
import 'package:mental_smile_os/app/router/routes.dart';
import 'package:mental_smile_os/features/commercial/presentation/widgets/commercial_room_screen_image.dart';
import 'package:mental_smile_os/l10n/commercial/commercial_localizations.dart';
import 'package:mental_smile_os/shared/accessibility/accessibility_guide_icon.dart';
import 'package:mental_smile_os/shared/accessibility/speech/localized_speech_action.dart';

class CommercialRoomUtilityTools extends StatefulWidget {
  const CommercialRoomUtilityTools({
    super.key,
    required this.cupPlacement,
    required this.featherPlacement,
    required this.featherImageSize,
    required this.noteTitle,
  });

  final CommercialRoomScreenPlacement cupPlacement;
  final CommercialRoomScreenPlacement featherPlacement;
  final double featherImageSize;
  final String noteTitle;

  @override
  State<CommercialRoomUtilityTools> createState() =>
      _CommercialRoomUtilityToolsState();
}

class _CommercialRoomUtilityToolsState
    extends State<CommercialRoomUtilityTools> {
  static const String _exitCup =
      'assets/commercial/commercial_room_utility_tools/commercial_room_exit_button.png';
  static const String _noteFeather =
      'assets/commercial/commercial_room_utility_tools/commercial_room_note_feather_button.png';

  String _savedNote = '';
  String _savedDateTime = '';

  void _exitRoom() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.residentialExitSocialLinks,
      (route) => false,
    );
  }

  Future<void> _speakCommercial(
    BuildContext context, {
    required String localizationKey,
    required String text,
  }) {
    return speakLocalizedText(
      context,
      sectionId: 'commercial',
      localizationKey: localizationKey,
      text: text,
    );
  }

  InputDecoration _notebookFieldDecoration({
    required String label,
    required VoidCallback onSpeak,
  }) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w700,
      ),
      floatingLabelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
      filled: true,
      fillColor: const Color(0xFFF2EFE8),
      prefixIcon: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 4),
        child: AccessibilityGuideIcon(
          size: 20,
          tooltipIconSize: 72,
          onPressed: onSpeak,
        ),
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 54),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0x667A5B1B)),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1.4),
      ),
    );
  }

  Future<void> _openNotebook(CommercialLocalizations l10n) async {
    final noteController = TextEditingController(text: _savedNote);
    final dateController = TextEditingController(text: _savedDateTime);
    await showDialog<void>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: const Color(0xFF090704),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: const BorderSide(color: Color(0xFFE0C174), width: 1.1),
          ),
          title: Row(
            children: [
              const Icon(Icons.edit_note_outlined, color: Color(0xFFFFE8A3)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.noteTitle,
                  style: const TextStyle(
                    color: Color(0xFFFFE8A3),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              AccessibilityGuideIcon(
                onPressed: () => _speakCommercial(
                  context,
                  localizationKey: 'commercialRoomNoteTitle',
                  text: widget.noteTitle,
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: 420,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: noteController,
                  maxLines: 5,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: _notebookFieldDecoration(
                    label: l10n.commercialRoomNotebookNote,
                    onSpeak: () => _speakCommercial(
                      context,
                      localizationKey: 'commercialRoomNotebookNote',
                      text: l10n.commercialRoomNotebookNote,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: dateController,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: _notebookFieldDecoration(
                    label: l10n.commercialRoomNotebookReminder,
                    onSpeak: () => _speakCommercial(
                      context,
                      localizationKey: 'commercialRoomNotebookReminder',
                      text: l10n.commercialRoomNotebookReminder,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _savedNote = '';
                  _savedDateTime = '';
                });
                noteController.clear();
                dateController.clear();
              },
              icon: const Icon(Icons.delete_outline),
              label: Text(l10n.commercialRoomNotebookDelete),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.commonBack),
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _savedNote = noteController.text.trim();
                  _savedDateTime = dateController.text.trim();
                });
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save_outlined, color: Colors.black),
              label: Text(l10n.commercialRoomNotebookSave),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE0C174),
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
    noteController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commercialL10n = CommercialLocalizations.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        _RoomAssetButton(
          assetPath: _noteFeather,
          placement: widget.featherPlacement,
          imageSize: widget.featherImageSize,
          tooltip: commercialL10n.commercialRoomNotebookTooltip,
          semanticLabel: widget.noteTitle,
          onPressed: () => _openNotebook(commercialL10n),
          onSpeak: () => _speakCommercial(
            context,
            localizationKey: 'commercialRoomNotebookTooltip',
            text: commercialL10n.commercialRoomNotebookTooltip,
          ),
        ),
        _RoomAssetButton(
          assetPath: _exitCup,
          placement: widget.cupPlacement,
          tooltip: commercialL10n.commercialRoomExitRoomTooltip,
          semanticLabel: commercialL10n.commercialRoomExitRoomTooltip,
          onPressed: _exitRoom,
          useAccessibilityGuideIcon: true,
          onSpeak: () => _speakCommercial(
            context,
            localizationKey: 'commercialRoomExitRoomTooltip',
            text: commercialL10n.commercialRoomExitRoomTooltip,
          ),
        ),
      ],
    );
  }
}

class _RoomAssetButton extends StatelessWidget {
  const _RoomAssetButton({
    required this.assetPath,
    required this.placement,
    required this.tooltip,
    required this.semanticLabel,
    required this.onPressed,
    required this.onSpeak,
    this.imageSize,
    this.useAccessibilityGuideIcon = true,
  });

  final String assetPath;
  final CommercialRoomScreenPlacement placement;
  final String tooltip;
  final String semanticLabel;
  final VoidCallback onPressed;
  final VoidCallback onSpeak;
  final double? imageSize;
  final bool useAccessibilityGuideIcon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: placement.left,
      top: placement.top,
      width: placement.width,
      height: placement.height,
      child: Semantics(
        button: true,
        label: semanticLabel,
        child: Tooltip(
          message: tooltip,
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onPressed,
                child: Center(
                  child: Image.asset(
                    assetPath,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: useAccessibilityGuideIcon
                    ? AccessibilityGuideIcon(onPressed: onSpeak)
                    : AccessibilityGuideIcon(
                        size: 22,
                        onPressed: onSpeak,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
