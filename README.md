# Home Assistant CoreDNS plugin

This fork keeps the Home Assistant DNS plugin buildable from this repository while preserving local China-specific defaults.

## Local defaults

- Fallback DNS is rewritten at container startup to `223.5.5.5` and `223.6.6.6`.
- Image metadata and signing identity point to `ha-china/plugin-dns` so this fork can keep publishing its own images.

## Sync from upstream

Use the `Sync upstream` GitHub Actions workflow to fetch and merge `home-assistant/plugin-dns` into your fork branch while preferring this fork's conflict resolutions.

Open `Actions` -> `Sync upstream` -> `Run workflow`, then choose the target branch. The default branch should be `master`.

The workflow will:

- fetch upstream branches and tags
- merge `upstream/master` into the selected branch with `-X ours` so fork-specific conflicts keep your side by default
- push the merged result back to your repository automatically

After syncing, you can continue building and publishing images from this repository as usual.

## Build images

`Build plugin` already supports manual runs in GitHub Actions and continues publishing this fork's DNS image from your repository.
