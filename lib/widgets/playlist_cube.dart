import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:musify/extensions/l10n.dart';
import 'package:musify/theme/app_colors.dart';
import 'package:musify/widgets/playlist_artwork.dart';

class PlaylistCube extends StatelessWidget {
  const PlaylistCube(
    this.playlist, {
    super.key,
    this.playlistData,
    this.cubeIcon = FluentIcons.text_bullet_list_24_filled,
    this.size = 220,
    this.borderRadius = 16,
    this.showTypeLabel = true,
  });

  final Map? playlistData;
  final Map playlist;
  final IconData cubeIcon;
  final double size;
  final double borderRadius;
  final bool showTypeLabel;

  static const double typeLabelOffset = 10;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          PlaylistArtwork(
            playlistArtwork: playlist['image'],
            size: size,
            cubeIcon: cubeIcon,
          ),
          if (showTypeLabel && playlist['image'] != null)
            Positioned(
              top: typeLabelOffset,
              right: typeLabelOffset,
              child: _buildLabel(context),
            ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    final isAlbum = playlist['isAlbum'] == true;
    return Container(
      decoration: BoxDecoration(
        color: tunePurple.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Text(
        isAlbum ? context.l10n!.album : context.l10n!.playlist,
        style: const TextStyle(
          color: tuneText,
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}
