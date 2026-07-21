import 'package:flutter/material.dart';

class AccessibilityGuideIcon extends StatelessWidget {
  const AccessibilityGuideIcon({
    super.key,
    this.size = 26,
    this.tooltipIconSize = 96,
    this.onPressed,
    this.tooltip,
    this.semanticLabel,
  });

  final double size;
  final double tooltipIconSize;
  final VoidCallback? onPressed;
  final String? tooltip;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onPressed != null,
      label: semanticLabel ?? tooltip ?? 'Listen',
      child: Tooltip(
        message: tooltip ?? 'Listen',
        child: IconButton(
          iconSize: size,
          padding: EdgeInsets.zero,
          constraints: BoxConstraints.tightFor(
            width: size + 18,
            height: size + 18,
          ),
          onPressed: onPressed,
          icon: const Icon(Icons.record_voice_over_outlined),
          color: const Color(0xFFFFD47A),
        ),
      ),
    );
  }
}

class DaleelAssistant extends StatelessWidget {
  const DaleelAssistant({
    super.key,
    required this.guideAssetPath,
    required this.surveyTitle,
    required this.sections,
    this.surveyIntro,
    this.extraTextFields = const [],
    this.suggestionsTitle = 'Suggestions',
    this.suggestionsLabel,
    this.suggestionsPlaceholder = 'Write your feedback...',
    this.iconOnly = false,
  });

  final String guideAssetPath;
  final String surveyTitle;
  final List<DaleelSurveySectionData> sections;
  final String? surveyIntro;
  final List<DaleelSurveyTextFieldData> extraTextFields;
  final String suggestionsTitle;
  final String? suggestionsLabel;
  final String suggestionsPlaceholder;
  final bool iconOnly;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: surveyTitle,
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.explore_outlined),
        label: iconOnly ? const SizedBox.shrink() : Text(surveyTitle),
      ),
    );
  }
}

class DaleelSurveySectionData {
  const DaleelSurveySectionData({required this.title, required this.questions});

  final String title;
  final List<DaleelSurveyQuestionData> questions;
}

class DaleelSurveyQuestionData {
  const DaleelSurveyQuestionData({
    required this.text,
    this.options = const ['Excellent', 'Good', 'Needs work'],
  });

  final String text;
  final List<String> options;
}

class DaleelSurveyTextFieldData {
  const DaleelSurveyTextFieldData({
    required this.sectionTitle,
    required this.label,
    required this.placeholder,
  });

  final String sectionTitle;
  final String label;
  final String placeholder;
}

class DaleelAssistantSurvey {
  const DaleelAssistantSurvey._();

  static const _defaultQuestion = DaleelSurveyQuestionData(text: 'Feedback');
  static const _defaultSection = DaleelSurveySectionData(
    title: 'Room feedback',
    questions: [_defaultQuestion],
  );

  static const clientRoomSections = [_defaultSection];
  static const accessibilityRoomSections = [_defaultSection];
  static const clientFriendMobileSections = [_defaultSection];
  static const premiumFriendMobileSections = [_defaultSection];
  static const premiumClientAccountSelectionMobileSections = [_defaultSection];
  static const supportersAccountSelectionMobileSections = [_defaultSection];
  static const mobileLoginSelectionSections = [_defaultSection];
}
