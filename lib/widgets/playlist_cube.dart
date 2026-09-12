import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:material_ui/material_ui.dart';
import 'package:musify/widgets/playlist_artwork.dart';

class PlaylistCube extends StatelessWidget {
  const PlaylistCube(
    this.playlist, {
    super.key,
    this.playlistData,
    this.cubeIcon = FluentIcons.text_bullet_list_24_filled,
    this.size = 220,
    this.borderRadius = 12,
    this.showTypeLabel = false,
  });

  final Map? playlistData;
  final Map playlist;
  final IconData cubeIcon;
  final double size;
  final double borderRadius;
  final bool showTypeLabel;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      clipBehavior: Clip.antiAlias,
      child: PlaylistArtwork(
        playlistArtwork: playlist['image'],
        size: size,
        cubeIcon: cubeIcon,
      ),
    );
  }
}
