import 'package:flutter/material.dart';
import 'package:mental_smile_os/l10n/app_localizations.dart';

class ArchiveRoomPage extends StatelessWidget {
  const ArchiveRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _OwnerOperationalBranchRoom(
      stamp: l10n.ownerArchiveTitle,
      title: l10n.ownerArchiveTitle,
      subtitle:
          'Certified memory and historical reference destination prepared for governed Archive runtime access.',
      groups: <_OwnerBranchGroup>[
        _OwnerBranchGroup(l10n.ownerBranchPurpose, <String>[
          'Historical memory',
          'Certified records',
          'Archive visibility',
        ]),
        _OwnerBranchGroup(l10n.ownerBranchBoundary, <String>[
          'No file movement',
          'No archive write runtime',
          'No operational execution',
        ]),
      ],
    );
  }
}

class MarketingMediaRoomPage extends StatelessWidget {
  const MarketingMediaRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _OwnerOperationalBranchRoom(
      stamp: l10n.ownerMarketingTitle,
      title: l10n.ownerMarketingTitle,
      subtitle:
          'Operational destination for media, publication, and promotion visibility readiness.',
      groups: <_OwnerBranchGroup>[
        _OwnerBranchGroup(l10n.ownerBranchPurpose, <String>[
          'Media visibility',
          'Publication coordination',
          'Campaign readiness',
        ]),
        _OwnerBranchGroup(l10n.ownerBranchBoundary, <String>[
          'No publishing runtime',
          'No campaign builder',
          'No asset automation',
        ]),
      ],
    );
  }
}

class TechnicalMaintenanceRoomPage extends StatelessWidget {
  const TechnicalMaintenanceRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _OwnerOperationalBranchRoom(
      stamp: l10n.ownerTechnicalTitle,
      title: l10n.ownerTechnicalTitle,
      subtitle:
          'Operational readiness room for maintenance visibility, reliability review, and technical coordination.',
      groups: <_OwnerBranchGroup>[
        _OwnerBranchGroup(l10n.ownerBranchPurpose, <String>[
          'Technical visibility',
          'Maintenance readiness',
          'Reliability coordination',
        ]),
        _OwnerBranchGroup(l10n.ownerBranchBoundary, <String>[
          'No deployment tools',
          'No infrastructure writes',
          'No monitoring mutation',
        ]),
      ],
    );
  }
}

class AccountingRoomPage extends StatelessWidget {
  const AccountingRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _OwnerOperationalBranchRoom(
      stamp: l10n.ownerAccountingTitle,
      title: l10n.ownerAccountingTitle,
      subtitle:
          'Operational readiness room for financial visibility and accounting records coordination.',
      groups: <_OwnerBranchGroup>[
        _OwnerBranchGroup(l10n.ownerBranchPurpose, <String>[
          'Financial visibility',
          'Accounting records',
          'Planning references',
        ]),
        _OwnerBranchGroup(l10n.ownerBranchBoundary, <String>[
          'No payment runtime',
          'No transaction processing',
          'No financial authority automation',
        ]),
      ],
    );
  }
}

class LegalRoomPage extends StatelessWidget {
  const LegalRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _OwnerOperationalBranchRoom(
      stamp: l10n.ownerLegalTitle,
      title: l10n.ownerLegalTitle,
      subtitle:
          'Operational readiness room for policy, compliance, risk, and legal review visibility.',
      groups: <_OwnerBranchGroup>[
        _OwnerBranchGroup(l10n.ownerBranchPurpose, <String>[
          'Policy visibility',
          'Compliance references',
          'Risk review',
        ]),
        _OwnerBranchGroup(l10n.ownerBranchBoundary, <String>[
          'No legal approval engine',
          'No policy automation',
          'No compliance execution',
        ]),
      ],
    );
  }
}

class _OwnerOperationalBranchRoom extends StatelessWidget {
  const _OwnerOperationalBranchRoom({
    required this.stamp,
    required this.title,
    required this.subtitle,
    required this.groups,
  });

  final String stamp;
  final String title;
  final String subtitle;
  final List<_OwnerBranchGroup> groups;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FB),
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF172033),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 960),
              child: _OwnerBranchCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _OwnerBranchStamp(text: stamp),
                    const SizedBox(height: 14),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF172033),
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF40506A),
                        fontSize: 16,
                        height: 1.45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 18),
                    for (final group in groups)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: _OwnerBranchLabelRow(
                          title: group.title,
                          values: group.values,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OwnerBranchCard extends StatelessWidget {
  const _OwnerBranchCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE1E5EE)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: child,
      ),
    );
  }
}

class _OwnerBranchLabelRow extends StatelessWidget {
  const _OwnerBranchLabelRow({
    required this.title,
    required this.values,
  });

  final String title;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF172033),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: values
              .map((value) => _OwnerBranchSignalBadge(label: value))
              .toList(growable: false),
        ),
      ],
    );
  }
}

class _OwnerBranchSignalBadge extends StatelessWidget {
  const _OwnerBranchSignalBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F0FF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE1D7FF)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF5630A6),
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class _OwnerBranchStamp extends StatelessWidget {
  const _OwnerBranchStamp({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFF172033),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}

class _OwnerBranchGroup {
  const _OwnerBranchGroup(this.title, this.values);

  final String title;
  final List<String> values;
}
