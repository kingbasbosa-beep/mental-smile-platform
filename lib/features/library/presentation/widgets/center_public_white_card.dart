import 'package:flutter/material.dart';
import 'package:mental_smile_os/shared/provider_profiles/provider_public_profile.dart';

class CenterPublicWhiteCard extends StatelessWidget {
  const CenterPublicWhiteCard({
    super.key,
    required this.profile,
  });

  final PublicProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    final otherServices = profile.otherServices?.trim();
    final shortBio = profile.shortBio?.trim();
    final email = profile.email?.trim();
    final phone = profile.phone?.trim();
    final showOtherServices = otherServices != null && otherServices.isNotEmpty;
    final showShortBio = shortBio != null && shortBio.isNotEmpty;
    final showEmail =
        profile.showEmailPublicly && email != null && email.isNotEmpty;
    final showPhone =
        profile.showPhonePublicly && phone != null && phone.isNotEmpty;

    return Card(
      key: ValueKey<String>('public-center-card-${profile.providerId}'),
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
            final image = _CenterPublicImage(profile: profile);
            final details = _CenterPublicDetails(
              profile: profile,
              showOtherServices: showOtherServices,
              otherServices: otherServices,
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

class _CenterPublicImage extends StatelessWidget {
  const _CenterPublicImage({required this.profile});

  final PublicProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    final imageUrl = profile.imageUrl?.trim();
    return ClipRRect(
      key: ValueKey<String>('public-center-image-${profile.providerId}'),
      borderRadius: BorderRadius.circular(18),
      child: SizedBox.square(
        dimension: 86,
        child: imageUrl == null || imageUrl.isEmpty
            ? const _CenterPublicImagePlaceholder()
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const _CenterPublicImagePlaceholder(),
              ),
      ),
    );
  }
}

class _CenterPublicImagePlaceholder extends StatelessWidget {
  const _CenterPublicImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xFFF1EEE8),
      child: Icon(
        Icons.apartment_outlined,
        color: Color(0xFF8C7651),
        size: 36,
      ),
    );
  }
}

class _CenterPublicDetails extends StatelessWidget {
  const _CenterPublicDetails({
    required this.profile,
    required this.showOtherServices,
    required this.otherServices,
    required this.showShortBio,
    required this.shortBio,
    required this.showEmail,
    required this.email,
    required this.showPhone,
    required this.phone,
  });

  final PublicProviderProfile profile;
  final bool showOtherServices;
  final String? otherServices;
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
          key: ValueKey<String>('public-center-name-${profile.providerId}'),
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
            'public-center-main-category-${profile.providerId}',
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF5E4F35),
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
        ),
        if (showOtherServices) ...<Widget>[
          const SizedBox(height: 6),
          Text(
            otherServices!,
            key: ValueKey<String>(
              'public-center-other-services-${profile.providerId}',
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
                'public-center-short-bio-${profile.providerId}'),
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
                _CenterContactLine(
                  key: ValueKey<String>(
                    'public-center-email-${profile.providerId}',
                  ),
                  icon: Icons.email_outlined,
                  text: email!,
                ),
              if (showPhone)
                _CenterContactLine(
                  key: ValueKey<String>(
                    'public-center-phone-${profile.providerId}',
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

class _CenterContactLine extends StatelessWidget {
  const _CenterContactLine({
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
