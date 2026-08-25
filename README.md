# Oligarchy: The 0.001% Club

An Omarchy theme for the billionaire operating system.

Oligarchy is designed for the Oligarchs who use Linux:

- midnight navy and graphite surfaces
- acid-lime action color with cyan information accents
- restrained gold for status and “wealth” moments
- crisp modern UI with a pixel-inspired wordmark
- cinematic automotive wallpapers inspired by Omarchy’s Quattro road imagery, without turning the desktop into a screensaver ad

## Screenshots:
 <img width="1920" height="1080" alt="Oligarchy Theme" src="https://github.com/user-attachments/assets/0d6f2ca7-0542-4246-9534-b015336f52fb" />

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

This repository includes the shared palette plus explicit styling for Hyprland borders, btop, Chromium, icons, boot unlock art, a theme preview, and four 1920×1080 wallpapers. It intentionally has no runtime plugin or external theme dependency.

## Development

The source assets for the unlock art and preview composition live in `art/source/`. The unlock preview uses a lightweight local crop of the Diablo wallpaper so SVG rendering stays portable. The four wallpapers are final raster assets in `backgrounds/`; rebuild the generated assets with:

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
