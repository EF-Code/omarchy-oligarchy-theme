# Oligarchy: The 0.001% Club

An Omarchy theme for the billionaire operating system.

Oligarchy is designed for the Oligarchs who use Linux:

- midnight navy and graphite surfaces
- acid-lime action color with cyan information accents
- restrained gold for status and “wealth” moments
- crisp modern UI with a pixel-inspired wordmark
- three satirical screen-print wallpapers: a public-computing factory, trickle-down computing, and a board-approved laptop

## Screenshots:
<img width="1920" height="1080" alt="screenshot-2026-08-27_00-24-13" src="https://github.com/user-attachments/assets/f76a9b17-783a-467e-b936-1d4b49cfa345" />

<img width="1920" height="1080" alt="Oligarchy Preview" src="https://github.com/user-attachments/assets/8b96eaec-32ee-4bc4-b337-ed196d9f9948" />


## Install

From an Omarchy system:

```bash
omarchy theme install https://github.com/EF-Code/omarchy-oligarchy-theme.git
```

Then select **Oligarchy** from the theme menu, or run:

```bash
omarchy theme set oligarchy
```

## Distribution

This is a theme, so its canonical home is a public GitHub repository. Omarchy can install it directly from the repository URL. It should not be submitted to the [Omarchy Plugins marketplace](https://omarchyplugins.com/), which is for runtime plugins with manifests and entry points. A future Oligarchy screensaver plugin could be published there separately; this theme can also be proposed for Omarchy’s official extra-themes list through the [theme guide](https://omarchy.org/manual/making-your-own-theme/).

## Theme surfaces

This repository includes the shared palette plus explicit styling for btop, Chromium, icons, boot unlock art, a theme preview, and three optimized 1920×1080 WebP wallpapers. Omarchy generates Hyprland and other runtime configuration from `colors.toml` when a theme is installed from Git. The wallpaper set pairs clear visual satire with large negative space so real terminal and editor windows remain comfortable on top of it. It intentionally has no runtime plugin or external theme dependency.

## Development

The source assets for the unlock art and preview composition live in `art/source/`. The unlock preview uses a lightweight local wallpaper crop so SVG rendering stays portable. The three wallpapers are optimized final raster assets in `backgrounds/`. Rebuild the vector unlock and preview assets with:

```bash
./scripts/render-assets.sh
```

Run the local contract checks with:

```bash
./scripts/validate-theme.sh
```

The validator checks the Omarchy-facing files, required palette keys, image dimensions, and the minimum contrast of the primary text colors. It does not apply the theme to the running desktop.

## Design copy

The deliberate microcopy is kept in visual assets rather than injected into system labels:

- `ACCESS TO THE MEANS OF PRODUCTION`
- `VOTING POWER: 0.001%`
- `LIQUIDITY: NONE`
- `BOARD: 1`
- `From the 0.001% to /home/you`
- `Redistributing billionaire wealth, one ISO at a time`

## License

MIT. See [LICENSE](LICENSE).
