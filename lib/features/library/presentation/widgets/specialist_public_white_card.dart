import 'package:flutter/material.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_public_profile.dart';

class SpecialistPublicWhiteCard extends StatelessWidget {
  const SpecialistPublicWhiteCard({
    super.key,
    required this.profile,
  });

  final PublicProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    final otherSpecialties = profile.otherSpecialties?.trim();
    final shortBio = profile.shortBio?.trim();
    final email = profile.email?.trim();
    final phone = profile.phone?.trim();
    final showOtherSpecialties =
        otherSpecialties != null && otherSpecialties.isNotEmpty;
    final showShortBio = shortBio != null && shortBio.isNotEmpty;
    final showEmail =
        profile.showEmailPublicly && email != null && email.isNotEmpty;
    final showPhone =
        profile.showPhonePublicly && phone != null && phone.isNotEmpty;

    return Card(
      key: ValueKey<String>('public-specialist-card-${profile.providerId}'),
      elevation: 2,
      margin: EdgeInsets.zero,
      color: Colors.white,
      shadowColor: Colors.black.withValues(alpha: 0.10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: Color(0xFFE8E2D7)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 520;
            final image = _SpecialistPublicImage(profile: profile);
            final details = _SpecialistPublicDetails(
              profile: profile,
              showOtherSpecialties: showOtherSpecialties,
              otherSpecialties: otherSpecialties,
              showShortBio: showShortBio,
              shortBio: shortBio,
              showEmail: showEmail,
              email: email,
              showPhone: showPhone,
              phone: phone,
            );

            if (!isWide) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(child: image),
                  const SizedBox(height: 14),
                  details,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                image,
                const SizedBox(width: 16),
                Expanded(child: details),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SpecialistPublicImage extends StatelessWidget {
  const _SpecialistPublicImage({required this.profile});

  final PublicProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    final imageUrl = profile.imageUrl?.trim();
    return ClipOval(
      key: ValueKey<String>('public-specialist-image-${profile.providerId}'),
      child: SizedBox.square(
        dimension: 82,
        child: imageUrl == null || imageUrl.isEmpty
            ? const _SpecialistPublicImagePlaceholder()
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const _SpecialistPublicImagePlaceholder(),
              ),
      ),
    );
  }
}

class _SpecialistPublicImagePlaceholder extends StatelessWidget {
  const _SpecialistPublicImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xFFF1EEE8),
      child: Icon(
        Icons.person_outline,
        color: Color(0xFF8C7651),
        size: 34,
      ),
    );
  }
}

class _SpecialistPublicDetails extends StatelessWidget {
  const _SpecialistPublicDetails({
    required this.profile,
    required this.showOtherSpecialties,
    required this.otherSpecialties,
    required this.showShortBio,
    required this.shortBio,
    required this.showEmail,
    required this.email,
    required this.showPhone,
    required this.phone,
  });

  final PublicProviderProfile profile;
  final bool showOtherSpecialties;
  final String? otherSpecialties;
  final bool showShortBio;
  final String? shortBio;
  final bool showEmail;
  final String? email;
  final bool showPhone;
  final String? phone;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          profile.displayName,
          key: ValueKey<String>('public-specialist-name-${profile.providerId}'),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleLarge?.copyWith(
            color: const Color(0xFF202124),
            fontWeight: FontWeight.w800,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          profile.categoryLabel,
          key: ValueKey<String>(
            'public-specialist-main-specialty-${profile.providerId}',
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF5E4F35),
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
        ),
        if (showOtherSpecialties) ...<Widget>[
          const SizedBox(height: 6),
          Text(
            otherSpecialties!,
            key: ValueKey<String>(
              'public-specialist-other-specialties-${profile.providerId}',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodySmall?.copyWith(
              color: const Color(0xFF6F6A60),
              height: 1.3,
            ),
          ),
        ],
        if (showShortBio) ...<Widget>[
          const SizedBox(height: 10),
          Text(
            shortBio!,
            key: ValueKey<String>(
              'public-specialist-short-bio-${profile.providerId}',
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF3D3D3D),
              height: 1.35,
            ),
          ),
        ],
        if (showEmail || showPhone) ...<Widget>[
          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFE8E2D7)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: <Widget>[
              if (showEmail)
                _SpecialistContactLine(
                  key: ValueKey<String>(
                    'public-specialist-email-${profile.providerId}',
                  ),
                  icon: Icons.email_outlined,
                  text: email!,
                ),
              if (showPhone)
                _SpecialistContactLine(
                  key: ValueKey<String>(
                    'public-specialist-phone-${profile.providerId}',
                  ),
                  icon: Icons.phone_outlined,
                  text: phone!,
                ),
            ],
          ),
        ],
      ],
    );
  }
}

class _SpecialistContactLine extends StatelessWidget {
  const _SpecialistContactLine({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 260),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 17, color: const Color(0xFF6B5A3D)),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF2F2F2F),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
