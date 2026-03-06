# ─── Stage 1: Build ───────────────────────────────────────────────────────────
# Pin to the exact Flutter version in use (matches pubspec.yaml: >=3.24.0).
# Bump this tag intentionally when upgrading Flutter.
FROM ghcr.io/cirruslabs/flutter:3.24.2 AS builder

WORKDIR /app

# Copy manifests first so dependency resolution is cached independently of
# source-code changes.  The layer is only invalidated when pubspec.* change.
COPY pubspec.yaml pubspec.lock ./
RUN flutter pub get

# Copy the rest of the source tree and build a release-mode web bundle.
COPY . .
RUN flutter build web --release

# ─── Stage 2: Serve ───────────────────────────────────────────────────────────
# Discard the Flutter SDK entirely; serve only the ~5 MB of compiled assets.
FROM nginx:1.26-alpine AS runner

# Custom config: serves the Flutter SPA and redirects unknown paths to
# index.html so client-side routing works on hard reload / direct URL access.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Replace default web root with the compiled Flutter output.
COPY --from=builder /app/build/web /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
