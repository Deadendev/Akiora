<div align="center">

# Akiora

**A modern, cross-platform anime streaming and tracking app.**

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)
![Built with Flutter](https://img.shields.io/badge/Built%20with-Flutter-02569B?logo=flutter)

</div>

---

Akiora is a fast, customisable anime player that brings cataloguing, streaming, danmaku, tracking, and watch-together into a single polished interface. Define your own video sources with a concise XPath rule format, watch in sync with friends, and enjoy real-time AI-powered upscaling on hardware as light as a phone.

## Highlights

- **Custom rule engine** — Define video sources with up to five lines of XPath selectors. Rules can be imported, exported, and shared.
- **Built-in player** — High-quality playback powered by libmpv. Hardware decoding, HLS support, ad filtering, and per-source playback overrides.
- **Real-time super-resolution** — Anime4K-based upscaling with quality and performance presets.
- **Danmaku** — Bullet-comment overlay with full style controls, keyword and regex blocklists, deduplication, and adjustable timing.
- **Watch tracking** — Personal watchlist with optional cross-device sync via Bangumi or WebDAV.
- **Watch Together** — Synchronised playback over the SyncPlay protocol with public and self-hosted servers.
- **Image search** — Identify any anime from a screenshot via trace.moe integration.
- **Offline downloads** — Per-episode or full-season downloads with adjustable concurrency and segment-level retries.
- **DLNA casting** and **external player** hand-off.
- **Adaptive UI** — Material You dynamic colour, OLED-friendly dark mode, high-refresh-rate support, custom title bars on desktop.

## Supported platforms

| Platform | Minimum version |
|----------|-----------------|
| Android  | 10              |
| iOS      | 13 (self-signing required for sideload) |
| Windows  | 10              |
| macOS    | 10.15           |
| Linux    | experimental — `.deb` recommended |

## Screenshots

<table>
  <tr>
    <td><img alt="" src="static/screenshot/img_1.png"></td>
    <td><img alt="" src="static/screenshot/img_2.png"></td>
    <td><img alt="" src="static/screenshot/img_3.png"></td>
  </tr>
  <tr>
    <td><img alt="" src="static/screenshot/img_4.png"></td>
    <td><img alt="" src="static/screenshot/img_5.png"></td>
    <td><img alt="" src="static/screenshot/img_6.png"></td>
  </tr>
</table>

## Installation

Pre-built binaries for each supported platform are published on the [Releases](https://github.com/Deadendev/Kazumi/releases) page.

> **iOS** builds require self-signing before sideloading.
> **Linux** users should prefer the `.deb` package; the `.tar.gz` is intended for repackaging only and lacks system-tray and icon integration by design.

## Building from source

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

A current Flutter SDK is required, along with the standard platform toolchain you target (Android Studio for Android, Xcode for iOS/macOS, Visual Studio with C++ tools for Windows, GCC + GTK for Linux).

App icons across every platform are regenerated from `assets/images/logo/` via:

```bash
dart run flutter_launcher_icons
```

## Configuration

Almost every behaviour is exposed through the in-app *Settings* menu, including:

- Video renderer and hardware decoder selection
- Super-resolution mode (off / performance / quality)
- Danmaku styling and shielding
- Download concurrency (per episode and per segment)
- Network proxy
- Sync providers (Bangumi token, WebDAV endpoint)
- Default startup screen, theme, and accent colour

For source-rule authoring, see the bundled examples and the *Rule Editor* page inside the app.

## FAQ

<details>
<summary>Why does playback stutter when I enable super-resolution?</summary>

Super-resolution is GPU-bound. On laptops or integrated GPUs, prefer the **Performance** preset. Applying super-resolution to lower-resolution sources is dramatically cheaper than applying it to high-resolution sources.
</details>

<details>
<summary>Memory usage during playback looks high.</summary>

The player aggressively buffers video to deliver smoother playback and faster seeking. On constrained devices, enable **Low Memory Mode** under *Player Settings* to bound the cache.
</details>

<details>
<summary>An external player can't open one of my videos.</summary>

Some sources require anti-hotlinking headers or cookies to deliver media. The built-in player handles this transparently; most external players cannot.
</details>

<details>
<summary>How do I write a custom rule?</summary>

Rules are five short XPath selectors targeting search results, episode lists, and the final stream URL. Only selectors starting with `//` are supported. Use one of the bundled examples as a template and verify the rule with the in-app *Test* tool.
</details>

<details>
<summary>I'm building from source and the build fails.</summary>

In addition to the Google-hosted Flutter dependencies, the build pulls native libraries from MavenCentral, GitHub, and SourceForge. If you are on a restricted network you may need to configure mirrors for those hosts.
</details>

## Contributing

Issues and pull requests are welcome. For new video-source rules in particular, please include a brief description and a sample query so reviewers can validate the rule end-to-end.

## Privacy

Akiora does not collect telemetry or personal data. Preferences and watch history are stored locally; optional sync flows go directly through the third-party services you configure (Bangumi, WebDAV, SyncPlay) and never touch any first-party server.

## License

Released under the [GNU General Public License v3.0](LICENSE). You are free to use, study, modify, and redistribute the software under the terms of that license.

## Built with

Akiora stands on the work of many excellent open-source projects:

- [Flutter](https://flutter.dev) — UI toolkit
- [media-kit](https://github.com/media-kit/media-kit) — cross-platform media playback
- [avbuild](https://github.com/wang-bin/avbuild) — extended FFmpeg builds
- [Hive](https://github.com/isar/hive) — local storage
- [XpathSelector](https://github.com/simonkimi/xpath_selector) — XPath engine
- [Anime4K](https://github.com/bloc97/Anime4K) — real-time upscaling shaders
- [Bangumi](https://bangumi.tv) — anime metadata API
- [DanDanPlay](https://www.dandanplay.com) — danmaku database API
- [SyncPlay](https://github.com/Syncplay/syncplay) — synchronised playback protocol
- [trace.moe](https://trace.moe) — reverse-image anime lookup
- [Mi Sans](https://hyperos.mi.com/font/en/details/sc/) — bundled font, © Xiaomi
